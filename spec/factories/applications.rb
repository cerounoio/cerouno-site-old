FactoryGirl.define do
  factory :application do
    status 'started'
    hidden false
    steps ['demographic']
    user
  end
end
