class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true,
                         format:   { with: /\A[[:alpha:]\s\-]+\z/ }

  validates :last_name, presence: true,
                        format:   { with: /\A[[:alpha:]\s\-]+\z/ }

  validates :email, presence:   true,
                    format:     { with: /\A.+@.+[.].+{2,}\z/ },
                    uniqueness: true

  validates :password, presence:     true,
                       confirmation: true

  has_many :applications
  has_one  :application

  def full_name
    "#{first_name} #{last_name}"
  end
end
