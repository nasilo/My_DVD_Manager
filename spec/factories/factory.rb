FactoryGirl.define do
  factory :dvd do
    title Faker::Book.title
    sequence(:upc) { |n| Faker::Number.number(10)+(100-n).to_s }
    user
  end
  factory :user do
    sequence(:email) { |n| "foob@example#{n}.com"}
    sequence(:name) { |n| "foobington#{n}" }
    sequence(:oauth_uid) { |n| n }
  end
end
