# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :keyword do
    brand { Faker::Lorem.word.capitalize }
    category { Faker::Lorem.word.capitalize }
    value { [brand.downcase, category.downcase, Faker::Lorem.word].join(" ")}
    target_url { Faker::Internet.url }
  end
end
