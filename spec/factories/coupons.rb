FactoryGirl.define do
  factory :coupon do
    code { Faker::Code.unique.asin }
    amount 10_000
    expiration DateTime.now + 1.day
    recruitment
  end
end
