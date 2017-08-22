require 'rails_helper'

RSpec.describe Address, type: :model do
  context 'when address is valid' do
    it 'creates address record' do
      application = build(:application)

      address = build(
        :address,
        line_1:      'Lardero 118',
        line_2:      'La Rioja',
        city:        'Monterrey',
        state:       'Nuevo León',
        zipcode:     '64984',
        application: application
        )

      expect(address).to be_valid
      expect(address.line_1).to eq 'Lardero 118'
      expect(address.line_2).to eq 'La Rioja'
      expect(address.city).to eq 'Monterrey'
      expect(address.state).to eq 'Nuevo León'
      expect(address.zipcode).to eq '64984'
      expect(address.application).to eq application
    end

    it 'knows when it is complete' do
      address = build(:address)

      expect(address.complete?).to be true
    end
  end

  context 'when address is invalid' do
    it 'does not create address without line_1' do
      address = build(:address, line_1: '')

      expect(address).not_to be_valid
    end

    it 'does not create address with an invalid line_1 format' do
      address = build(:address, line_1: 'adasda#@%%#')

      expect(address).not_to be_valid
    end

    it 'does not create address without city' do
      address = build(:address, city: '')

      expect(address).not_to be_valid
    end

    it 'does not create address with an invalid line_1 format' do
      address = build(:address, city: 'adasda#@%%#')

      expect(address).not_to be_valid
    end

    it 'does not create address without state' do
      address = build(:address, state: '')

      expect(address).not_to be_valid
    end

    it 'does not create address without zipcode' do
      address = build(:address, zipcode: '')

      expect(address).not_to be_valid
    end

    it 'does not create address without a 5-digit zipcode' do
      address = build(:address, zipcode: '123456')

      expect(address).not_to be_valid
    end

    it 'does not create address without an only-digit zipcode' do
      address = build(:address, zipcode: '1234a')

      expect(address).not_to be_valid
    end
  end
end
