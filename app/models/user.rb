class User < ApplicationRecord
  has_secure_password
  has_secure_token

  validates :first_name, presence: true,
                         format:   { with: /\A[[:alpha:]\s\-]+\z/ }

  validates :last_name, presence: true,
                        format:   { with: /\A[[:alpha:]\s\-]+\z/ }

  validates :email, presence:   true,
                    format:     { with: /\A.+@.+[.].+{2,}\z/ },
                    uniqueness: true

  validates :whatsapp, presence: true,
                       format: { with: /\A[\d]+\z/ },
                       length: { is: 10 }

  validates :password, presence:     true,
                       confirmation: true

  validates :policies, presence: { message: "deben ser aceptados por el usuario." }

  has_many :applications
  has_one  :application

  def full_name
    "#{first_name} #{last_name}"
  end
end
