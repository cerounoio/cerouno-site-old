require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when user is valid' do
    it 'creates user record' do
      user = build(
        :user,
        first_name:            'Jorge',
        last_name:             'Téllez',
        email:                 'jorge@example.com',
        password:              'password',
        password_confirmation: 'password'
        )

      expect(user).to be_valid
      expect(user.first_name).to eq  'Jorge'
      expect(user.last_name).to eq 'Téllez'
      expect(user.email).to eq 'jorge@example.com'
    end
  end

  context 'when user is invalid' do
    it 'does not create user without first name' do
      user = build(:user, first_name: '')

      expect(user).not_to be_valid
    end

    it 'does not create user with non-letter characters first name' do
      user = build(:user, first_name: '12312Jorge')

      expect(user).not_to be_valid
    end

    it 'does not create user without last name' do
      user = build(:user, last_name: '')

      expect(user).not_to be_valid
    end

    it 'does not create user with non-letter characters last name' do
      user = build(:user, last_name: '12312Jorge')

      expect(user).not_to be_valid
    end

    it 'does not create user without email' do
      user = build(:user, email: '')

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
      user = build(:user, password: '')

      expect(user).not_to be_valid
    end

    it 'does not create user without password confirmation' do
      user = build(:user, password_confirmation: '')

      expect(user).not_to be_valid
    end
  end
end
