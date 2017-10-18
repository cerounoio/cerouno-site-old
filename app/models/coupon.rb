class Coupon < ApplicationRecord
  has_many :recruitments
  has_many :applications, through: :recruitments
  has_many :users, through: :applications

  validates :code,   presence: true, uniqueness: true, format: { with: /\A[[:alpha:]\d]+\z/ }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def expired?
    expiration.present? ? expiration <= DateTime.now : false
  end

  def to_s
    code
  end
end
