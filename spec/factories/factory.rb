FactoryGirl.define do
  factory :upc do
    sequence(:upc) { |n| Faker::Number.number(10)+(100-n).to_s }
  end
  factory :dvd do
    title Faker::Book.title
    image_small Faker::Placeholdit.image
    image_large Faker::Placeholdit.image
    upc
    user
  end
  factory :user do
    sequence(:email) { |n| "foob@example#{n}.com"}
    sequence(:name) { |n| "foobington#{n}" }
    sequence(:oauth_uid) { |n| n }
  end
end
