FactoryGirl.define do
  factory :user do
    first_name            'Fernanda'
    last_name             'Sosa'
    email                 'fernanda@example.com'
    password              'password'
    password_confirmation 'password'
  end
end
