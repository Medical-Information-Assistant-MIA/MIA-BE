# FactoryBot.define do 
#   factory :medication do 
#     name {Faker::Lorem.word} #Faker::Science.element => Carbon ...it's sciencey
#     pseudonym {Faker::Lorem.word}
#     date_prescribed {}
#     dosage {} #250mg {Faker::Number.within(range: 50..500) + "mg"}
#     frequency {}
#     as_needed {}
#     # prescribed_by {} doctor's name? Maybe hard code the name in the test?
#     condition 
#   end
# end