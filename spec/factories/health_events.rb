FactoryBot.define do
  factory :health_event do
    note { Faker::Lorem.paragraph(sentence_count: 2) }
    date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    # category {Faker::Number.within(range: 0..1)} might want to set specific category in test?
    condition
  end
end
