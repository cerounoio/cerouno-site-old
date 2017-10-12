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

    it 'knows it\'s total' do
      evaluation = build(:evaluation)

      expect(evaluation.total).to be 19
    end

    it 'knows when it passed' do
      evaluation = build(:evaluation)

      expect(evaluation.passed?).to be true
      expect(evaluation.failed?).to be false
    end

    it 'knows when it failed' do
      evaluation = build(:evaluation, logic: 1, resilience: 1)

      expect(evaluation.failed?).to be true
      expect(evaluation.passed?).to be false
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

    it 'knows it\'s status' do
      pending_application = build(:evaluation, logic: nil)
      expect(pending_application.status).to eq 'pending'

      passed_application  = build(:evaluation)
      expect(passed_application.status).to eq 'passed'

      failed_application  = build(:evaluation, logic: 1, initiative: 1)
      expect(failed_application.status).to eq 'failed'
    end
  end
end
