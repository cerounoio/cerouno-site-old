FactoryGirl.define do
  factory :evaluation do
    initiative 4
    collaboration 2
    organization 4
    diversity 1
    resilience 3
    logic 5
    application
    association :evaluator, factory: :user
  end
end
