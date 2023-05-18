FactoryBot.define do
  factory :health_event do
    association :condition
    note { Faker::Lorem.paragraph(sentence_count: 2) }
    date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    category { Faker::Number.within(range: 0..5) }
  end
end
