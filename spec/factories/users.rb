FactoryGirl.define do
  factory :user do
    first_name            'Fernanda'
    last_name             'Sosa'
    email                 { Faker::Internet.unique.email }
    password              'password'
    password_confirmation 'password'
    whatsapp              '1234567890'
    admin                 false
    policies              true
  end
end
