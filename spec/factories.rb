FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    email    "michael@example.com"
    password "foobarfoobar"
    password_confirmation "foobarfoobar"
  end
end

