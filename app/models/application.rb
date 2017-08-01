class Application < ApplicationRecord
  STEPS = %w(demographic address experience referral)

  belongs_to :user

  validate :valid_steps

  enum status: {
    started:                  0,
    submitted:                1,
    needs_schedule_interview: 2,
    needs_interview_scores:   3,
    needs_invitation:         4,
    accepted:                 5,
    declined:                 6,
    needs_rejection:          7,
    rejected:                 8
  }

  private

  def valid_steps
    steps.each do |step|
      errors.add(:steps, 'is an invalid step') unless STEPS.include?(step)
    end
  end
end
