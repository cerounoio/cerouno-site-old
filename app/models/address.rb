class Address < ApplicationRecord
  belongs_to :application

  validates :line_1,  presence: true, format: { with: /\A[[:alpha:]\s\d#.\-]+\z/ }
  validates :line_2,  format: { with: /\A[[:alpha:]\s\d#.\-]+\z/ }
  validates :city,    presence: true, format: { with: /\A[[:alpha:]\s\-]+\z/ }
  validates :state,   presence: true, format: { with: /\A[[:alpha:]\s]+\z/}
  validates :zipcode, presence: true, format: { with: /\A[\d]+\z/ }, length: { is: 5 }

  def complete?
    true if line_1.present? && city.present? && state.present? && zipcode.present?
  end
end
