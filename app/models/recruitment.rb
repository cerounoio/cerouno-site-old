class Recruitment < ApplicationRecord
  belongs_to :application
  belongs_to :coupon, optional: true

  validates :referral, presence: true

  enum referral: {
    google:    0,
    facebook:  1,
    twitter:   2,
    instagram: 3,
    medium:    4,
    family:    5,
    friends:   6,
    company:   7,
    college:   8,
    other:     9
  }

  def complete?
    referral.present?
  end

  def add_coupon(code)
    coupon = Coupon.find_by(code: code)

    if coupon && !coupon.expired?
      self.coupon = coupon
      true
    else
      errors.add(:coupon, 'no es válido')
      false
    end
  end
end
