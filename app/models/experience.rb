class Experience < ApplicationRecord
  belongs_to :application

  validates :education,            presence: true
  validates :income,               presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :technical_experience, inclusion: { in: [true, false] }
  validates :objective,            presence: true
  validates :resume_id,            presence: true

  enum education: {
    high_school: 0,
    college:     1,
    masters:     2,
    doctorate:   3
  }

  enum objective: {
    developer: 0,
    startup:   1,
    level_up:  2,
    manager:   3,
    otro:      4
  }

  def complete?
    education.present?                          &&
    income.present?                             &&
    [true,false].include?(technical_experience) &&
    objective.present?                          &&
    resume_id.present?
  end
end
