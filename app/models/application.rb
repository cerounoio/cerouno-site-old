class Application < ApplicationRecord
  STEPS = %w(demographic address experience recruitment)

  belongs_to :user

  validate :valid_steps

  enum status: {
    started:                  0,
    submitted:                1,
    needs_schedule_interview: 2,
    needs_interview_scores:   3,
    needs_invitation:         4,
    accepted_invitation:      5,
    declined_invitation:      6,
    needs_rejection:          7,
    rejected:                 8
  }

  def pending_steps
    STEPS - steps
  end

  private

  def valid_steps
    steps.each do |step|
      errors.add(:steps, 'is an invalid step') unless STEPS.include?(step)
    end
  end
end
