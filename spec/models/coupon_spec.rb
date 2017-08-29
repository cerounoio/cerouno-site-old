require 'rails_helper'

RSpec.describe Coupon, type: :model do
  context 'when coupon is valid' do
    it 'creates coupon record' do
      recruitment = build(:recruitment)

      coupon = build(
        :coupon,
        code:        'SIMON500',
        amount:      20_000,
        expiration:  DateTime.new(1981,4,23),
        recruitment: recruitment
        )

      expect(coupon).to be_valid
      expect(coupon.code).to eq 'SIMON500'
      expect(coupon.amount).to eq 20_000
      expect(coupon.expiration).to eq DateTime.new(1981,4,23)
      expect(coupon.recruitment).to eq recruitment
    end

    it 'knows when it expired' do
      expired_coupon = build(:coupon, expiration: DateTime.new(1981,4,23))
      expect(expired_coupon.expired?).to eq true

      valid_coupon = build(:coupon, expiration: DateTime.now + 1.day)
      expect(valid_coupon.expired?).to eq false
    end
  end

  context 'when coupon is invalid' do
    it 'does not create coupon without code' do
      coupon = build(:coupon, code: '')

      expect(coupon).not_to be_valid
    end

    it 'does not create coupon with a repeated code' do
      coupon = create(:coupon, code: 'SIMON10')
      expect(coupon).to be_valid

      repeated_coupon = build(:coupon, code: 'SIMON10')
      expect(repeated_coupon).not_to be_valid
    end

    it 'does not create coupon without an alphanumeric code' do
      coupon = build(:coupon, code: 'SIMON-500')

      expect(coupon).not_to be_valid
    end

    it 'does not create coupon without amount' do
      coupon = build(:coupon, amount: '')

      expect(coupon).not_to be_valid
    end

    it 'does not create coupon with negative amount' do
      coupon = build(:coupon, amount: -50)

      expect(coupon).not_to be_valid
    end
  end
end
