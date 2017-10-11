require 'rails_helper'

RSpec.describe Evaluation, type: :model do
  context 'when evaluation is valid' do
    it 'creates evaluation record' do
      evaluator   = build(:user)
      application = build(:application)

      evaluation = build(
        :evaluation,
        initiative:    5,
        collaboration: 4,
        organization:  3,
        diversity:     2,
        resilience:    1,
        logic:         5,
        application:   application,
        evaluator:     evaluator
        )

      expect(evaluation).to be_valid
      expect(evaluation.initiative).to eq 5
      expect(evaluation.collaboration).to eq 4
      expect(evaluation.organization).to eq 3
      expect(evaluation.diversity).to eq 2
      expect(evaluation.resilience).to eq 1
      expect(evaluation.logic).to eq 5
      expect(evaluation.application).to eq application
      expect(evaluation.evaluator).to eq evaluator
    end

    it 'knows when it is complete' do
      evaluation = build(:evaluation)

      expect(evaluation.complete?).to be true
    end
  end

  context 'when evaluation is invalid' do
    it 'does not create evaluation without critarium' do
      criteria = [:initiative, :collaboration, :organization, :diversity, :resilience, :logic]

      criteria.each do |criterium|
        evaluation = build(:evaluation, {criterium => ''})
        expect(evaluation).not_to be_valid
      end
    end

    it 'does not create evaluation with an invalid criterium range' do
      criteria = [:initiative, :collaboration, :organization, :diversity, :resilience, :logic]

      criteria.each do |criterium|
        evaluation = build(:evaluation, {criterium => -1})
        expect(evaluation).not_to be_valid
      end
    end

    it 'does not create evaluation with an fractional criterium range' do
      criteria = [:initiative, :collaboration, :organization, :diversity, :resilience, :logic]

      criteria.each do |criterium|
        evaluation = build(:evaluation, {criterium => 2.3})
        expect(evaluation).not_to be_valid
      end
    end
  end
end
