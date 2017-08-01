FactoryGirl.define do
  factory :application do
    status 'started'
    steps ['demographic']
    user
  end
end
