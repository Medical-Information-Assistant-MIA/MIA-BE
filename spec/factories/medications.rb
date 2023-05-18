FactoryBot.define do
  factory :medication do
    association :condition
    name { Faker::Lorem.word } # Faker::Science.element => Carbon ...it's sciencey
    date_prescribed { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    dosage { "#{rand(50..500)} mg" }
    frequency { "Take #{rand(1..3)} per day." }
    prescribed_by { Faker::Name.name }
  end
end
