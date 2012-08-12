FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    email    "michael@example.com"
    password "foobarfoobar"
    password_confirmation "foobarfoobar"
  end

  factory :plan do
    expense_mean  50000.0
    expense_sd    10000.0
    income        90000.0
    increase_mean     0.03
    increase_sd       0.005
    user
  end
end
