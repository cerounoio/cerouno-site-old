class User < ApplicationRecord
  has_secure_password

  validates :name,     presence: true, format: { with: /\A[[:alpha:]\s]+\z/ }
  validates :email,    presence: true, format: { with: /\A.+@.+[.].+{2,}\z/ }
  validates :password, presence: true, confirmation: true
end
