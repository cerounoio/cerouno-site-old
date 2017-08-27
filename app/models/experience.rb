class Experience < ApplicationRecord
  attachment :resume, extension: ['pdf', 'doc', 'docx']

  belongs_to :application

  validates :education,            presence: true
  validates :income,               presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :technical_experience, inclusion: { in: [true, false] }
  validates :objective,            presence: true

  validate :presence_of_resume

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
    other:     4
  }

  def complete?
    education.present?                          &&
    income.present?                             &&
    [true,false].include?(technical_experience) &&
    objective.present?                          &&
    resume_id.present?
  end

  private

  def presence_of_resume
    errors.add(:resume, 'no puede estar en blanco') unless resume.present?
  end
end
