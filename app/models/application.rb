class Application < ApplicationRecord
  STEPS = %w(demographic address experience recruitment)

  belongs_to :user
  has_one    :demographic
  has_one    :address
  has_one    :experience
  has_one    :recruitment
  has_one    :evaluation

  validate :valid_steps

  enum status: {
    started:                  0,
    submitted:                1,
    needs_interview_scores:   2,
    needs_invitation:         3,
    accepted_invitation:      4,
    declined_invitation:      5,
    needs_rejection:          6,
    rejected:                 7
  }

  scope :visible, -> { where(hidden: false) }
  scope :hidden,  -> { where(hidden: true) }

  def complete?
    demographic.try(:complete?) &&
    address.try(:complete?)     &&
    experience.try(:complete?)  &&
    recruitment.try(:complete?)
  end

  def pending_steps
    STEPS - steps
  end

  def add_step(step)
    steps << step unless steps.include?(step)
    save
  end

  def remove_step(step)
    self.steps = self.steps.reject { |step| step == step }
    save
  end

  def hidden?
    hidden
  end

  def visible?
    !hidden
  end

  def toggle
    update_column(:hidden, !hidden)
  end

  private

  def valid_steps
    steps.each do |step|
      errors.add(:steps, 'is an invalid step') unless STEPS.include?(step)
    end
  end
end
