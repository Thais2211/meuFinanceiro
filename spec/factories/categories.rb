FactoryBot.define do
  factory :category do
    title { Faker::Lorem.sentence }
    kind { Category.kinds.values.sample }
  end
end
