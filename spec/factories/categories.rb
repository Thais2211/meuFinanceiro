FactoryBot.define do
  factory :category do
    title { Faker::Lorem.sentence }
    type { Category.types.values.sample }
  end
end
