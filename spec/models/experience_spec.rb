require 'rails_helper'

RSpec.describe Experience, type: :model do
  context 'when experience is valid' do
    it 'creates experience record' do
      application = build(:application)

      experience = build(
        :experience,
        education:            'college',
        income:               10_000,
        technical_experience: false,
        objective:            'startup',
        resume_id:            '1',
        resume_filename:      'simon_sosa.pdf',
        program:              'apprenticeship',
        application:          application
        )

      expect(experience).to be_valid
      expect(experience.education).to eq 'college'
      expect(experience.income).to eq 10_000
      expect(experience.technical_experience).to eq false
      expect(experience.objective).to eq 'startup'
      expect(experience.resume_id).to eq '1'
      expect(experience.resume_filename).to eq 'simon_sosa.pdf'
      expect(experience.program).to eq 'apprenticeship'
      expect(experience.application).to eq application
    end

    it 'knows when it is complete' do
      experience = build(:experience)

      expect(experience.complete?).to be true
    end
  end

  context 'when experience is invalid' do
    it 'does not create experience without education' do
      experience = build(:experience, education: '')

      expect(experience).not_to be_valid
    end

    it 'does not create experience without income' do
      experience = build(:experience, income: '')

      expect(experience).not_to be_valid
    end

    it 'does not create experience when income is not a number' do
      experience = build(:experience, income: 'asdasdas')

      expect(experience).not_to be_valid
    end

    it 'does not create experience when income is not a positive number' do
      experience = build(:experience, income: -1000)

      expect(experience).not_to be_valid
    end

    it 'does not create experience without technical_experience' do
      experience = build(:experience, technical_experience: '')

      expect(experience).not_to be_valid
    end

    it 'does not create experience without objective' do
      experience = build(:experience, objective: '')

      expect(experience).not_to be_valid
    end

    it 'does not create experience without resume' do
      experience = build(:experience, resume: '')

      expect(experience).not_to be_valid
    end

    it 'does not create experience without program' do
      experience = build(:experience, program: '')

      expect(experience).not_to be_valid
    end
  end
end
