require 'rails_helper'

RSpec.describe Demographic, type: :model do
  context 'when demographic is valid' do
    it 'creates demographic record' do
      application = build(:application)

      demographic = build(
        :demographic,
        gender:      'female',
        birthdate:   'June 30, 1979',
        application: application
        )

      expect(demographic).to be_valid
      expect(demographic.gender).to eq  'female'
      expect(demographic.birthdate).to eq Date.new(1979, 6, 30)
      expect(demographic.application).to eq application
    end

    it 'knows when it is complete' do
      demographic = build(:demographic)

      expect(demographic.complete?).to be true
    end
  end

  context 'when demographic is invalid' do
    it 'does not create demographic without birthdate' do
      demographic = build(:demographic, birthdate: '')

      expect(demographic).not_to be_valid
    end

    it 'does not create demographic without gender' do
      demographic = build(:demographic, gender: '')

      expect(demographic).not_to be_valid
    end
  end
end
