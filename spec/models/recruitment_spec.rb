require 'rails_helper'

RSpec.describe Recruitment, type: :model do
  context 'when recruitment is valid' do
    it 'creates recruitment record' do
      application = build(:application)

      recruitment = build(
        :recruitment,
        referral:     'facebook',
        application:  application
        )

      expect(recruitment).to be_valid
      expect(recruitment.referral).to eq 'facebook'
      expect(recruitment.application).to eq application
    end
  end

  context 'when recruitment is invalid' do
    it 'does not create recruitment without referral' do
      recruitment = build(:recruitment, referral: '')

      expect(recruitment).not_to be_valid
    end

    it 'does not create recruitment with an invalid coupon' do
      coupon      = create(:coupon, code: 'DINO100')
      recruitment = build(:recruitment, coupon: nil)

      expect(recruitment.add_coupon('DINO000')).to eq false
      expect(recruitment.coupon).to eq nil

      expect(recruitment.add_coupon('DINO100')).to eq true
      expect(recruitment.coupon).to eq coupon
    end

    it 'does not create recruitment without an expired coupon' do
      expired_coupon = create(:coupon, code: 'DINO100', expiration: DateTime.new(1981,4,23))
      valid_coupon   = create(:coupon, code: 'DINO200', expiration: DateTime.now + 1.day)
      recruitment    = build(:recruitment, coupon: nil)

      expect(recruitment.add_coupon('DINO100')).to eq false
      expect(recruitment.coupon).to eq nil

      expect(recruitment.add_coupon('DINO200')).to eq true
      expect(recruitment.coupon).to eq valid_coupon
    end
  end
end
