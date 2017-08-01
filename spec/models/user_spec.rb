require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when user is valid' do
    it 'creates user record' do
      user = User.create(
        name:                  'Jorge Téllez',
        email:                 'jorge@example.com',
        password:              'password',
        password_confirmation: 'password'
        )

      expect(user).to be_valid
      expect(user.name).to eq  'Jorge Téllez'
      expect(user.email).to eq 'jorge@example.com'
    end
  end

  context 'when user is invalid' do
    it 'does not create user without name' do
      user = User.create(
        email:                 'jorge@example.com',
        password:              'password',
        password_confirmation: 'password'
        )

      expect(user).not_to be_valid
    end

    it 'does not create user with non-letter characters' do
      user = User.create(
        name:                  '12312Jorge',
        email:                 'jorge@example.com',
        password:              'password',
        password_confirmation: 'password'
        )

      expect(user).not_to be_valid
    end

    it 'does not create user without email' do
      user = User.create(
        name:                  'Jorge',
        password:              'password',
        password_confirmation: 'password'
        )

      expect(user).not_to be_valid
    end

    it 'does not create user with invalid email' do
      user = User.create(
        name:                  'Jorge Téllez',
        email:                 'jorge@example.',
        password:              'password',
        password_confirmation: 'password'
        )

      expect(user).not_to be_valid
    end

    it 'does not create user without password' do
      user = User.create(
        name:                  'Jorge Téllez',
        email:                 'jorge@example.com',
        )

      expect(user).not_to be_valid
    end
  end
end
