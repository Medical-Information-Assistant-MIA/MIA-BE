FactoryBot.define do 
  factory :user do 
    name {Faker::Name.name}
    email {Faker::Internet.email}
    # email {"#{name}.example@email.com"}
  end

end
