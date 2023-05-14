FactoryBot.define do 
  factory :user do 
    name {Faker::Name.name}
    email {"#{name.delete(" ").downcase}.example@email.com"}
  end
end

def user_with_three_conditions(conditions_count: 3) 
  FactoryBot.create(:user) do |user|
    FactoryBot.create_list(:condition, conditions_count, user: user)
  end
end
