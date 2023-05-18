FactoryBot.define do
  factory :condition do
    association :user
    name { Faker::Lorem.word } # Faker::Emotion.noun ??
  end
end
