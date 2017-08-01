require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when user is valid' do
    it 'creates user record' do
      user = build(
        :user,
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
      user = build(:user, name: nil)

      expect(user).not_to be_valid
    end

    it 'does not create user with non-letter characters' do
      user = build(:user, name: '12312Jorge')

      expect(user).not_to be_valid
    end

    it 'does not create user without email' do
      user = build(:user, email: nil)

      expect(user).not_to be_valid
    end

    it 'does not create user with invalid email' do
      user = build(:user, email: 'jorge@example.')

      expect(user).not_to be_valid
    end

    it 'does not create a user with a duplicate email' do
      first_user = create(:user, email: 'jorge@example.com')

      expect(first_user).to be_valid

      second_user = build(:user, email: 'jorge@example.com')

      expect(second_user).not_to be_valid
    end

    it 'does not create user without password' do
      user = build(:user, password: nil)

      expect(user).not_to be_valid
    end

    it 'does not create user without password confirmation' do
      user = build(user, password_confirmation: nil)

      expect(user).not_to be_valid
    end
  end
end
