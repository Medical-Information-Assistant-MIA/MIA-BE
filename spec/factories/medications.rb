FactoryBot.define do 
  factory :medication do 
    name {Faker::Lorem.word} #Faker::Science.element => Carbon ...it's sciencey
    pseudonym {Faker::Lorem.word}
    date_prescribed {Faker::Date.between(from: 2.days.ago, to: Date.today)}
    dosage {"#{rand(50..500)} mg"} 
    frequency {"Take #{rand(1..3)} per day."}
    as_needed {Faker::Boolean.boolean}
    # prescribed_by {} doctor's name? Maybe hard code the name in the test?
    condition 
  end
end