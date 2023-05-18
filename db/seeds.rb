# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"

# Create User 1 with Conditions, Doctors, Medications, and Health Events
user1 = FactoryBot.create(:user)

3.times do
  condition = FactoryBot.create(:condition, user: user1)

  2.times do
    FactoryBot.create(:doctor, condition: condition)
    FactoryBot.create(:medication, condition: condition)
    FactoryBot.create(:health_event, condition: condition)
  end
end

# Create User 2 with Conditions, Doctors, Medications, and Health Events
user2 = FactoryBot.create(:user)

3.times do
  condition = FactoryBot.create(:condition, user: user2)

  2.times do
    FactoryBot.create(:doctor, condition: condition)
    FactoryBot.create(:medication, condition: condition)
    FactoryBot.create(:health_event, condition: condition)
  end
end
