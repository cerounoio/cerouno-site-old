class Evaluation < ApplicationRecord
  MINIMUM_SCORE = 15

  belongs_to :application
  belongs_to :evaluator, class_name: 'User'

  validates :initiative,    presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :collaboration, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :organization,  presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :diversity,     presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :resilience,    presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :logic,         presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}

  def complete?
    initiative.present?    &&
    collaboration.present? &&
    organization.present?  &&
    diversity.present?     &&
    resilience.present?    &&
    logic.present?
  end

  def total
    initiative + collaboration + organization + diversity + resilience + logic
  end

  def passed?
    total >= MINIMUM_SCORE
  end

  def failed?
    !passed?
  end
end
