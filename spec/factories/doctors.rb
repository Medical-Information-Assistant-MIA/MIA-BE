FactoryBot.define do
  factory :doctor do
		association :condition
    name { Faker::Name.name }
    address { Faker::Address.full_address }
    phone { Faker::PhoneNumber.phone_number }
    category { Faker::Lorem.word } # Faker::Job.field (but it's not medical specific)
    
  end
end
