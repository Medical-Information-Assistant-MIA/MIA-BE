FactoryBot.define do 
  factory :condition do 
    name {Faker::Lorem.word} #Faker::Emotion.noun ?? 
    user
  end
end