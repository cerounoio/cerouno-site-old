class Demographic < ApplicationRecord
  belongs_to :application

  enum gender: {
    female: 0,
    male:   1,
    other:  2
  }

  validates :birthdate, presence: true
  validates :gender,    presence: true

  def complete?
    gender.present? && birthdate.present?
  end
end
