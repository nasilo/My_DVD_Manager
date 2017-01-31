FactoryGirl.define do
  factory :dvd do
    title Faker::Book.title
    sequence(:upc) { |n| Faker::Number.number(10)+(100-n).to_s }
  end
end
