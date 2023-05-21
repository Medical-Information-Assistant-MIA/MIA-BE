# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"

CONDITIONS = [
  "Hypertension",
  "Diabetes",
  "Asthma",
  "Arthritis",
  "Depression",
  "Migraine",
  "Allergies",
  "Insomnia",
  "Bronchitis",
  "Gastritis"
].freeze

# Create User 1 with Conditions, Doctors, Medications, and Health Events
user1_name = Faker::DcComics.villain
user1_email = "#{user1_name.downcase.tr(' ', '_')}@example.com"
user1 = User.create(name: user1_name, email: user1_email)
3.times do
  condition_name = CONDITIONS.sample
  condition = Condition.create(user: user1, name: condition_name)

  2.times do
    doctor = Doctor.create(
      condition: condition,
      name: Faker::DcComics.name,
      address: Faker::Address.full_address,
      phone: Faker::PhoneNumber.phone_number,
      category: Faker::Job.field
    )

    medication = Medication.create(
      condition: condition,
      name: Faker::Cannabis.strain,
      date_prescribed: Faker::Date.between(from: 5.years.ago, to: Date.today),
      dosage: "100mg",
      frequency: "daily",
      prescribed_by: doctor.name
    )

    HealthEvent.create(
      condition: condition,
      note: Faker::Cannabis.medical_use,
      date: Faker::Date.between(from: 1.year.ago, to: Date.today),
      category: Faker::Number.between(from: 0, to: 2) # Adjust range as per your category options
    )
  end
end

# Create User 2 with Conditions, Doctors, Medications, and Health Events
user2_name = Faker::DcComics.villain
user2_email = "#{user2_name.downcase.tr(' ', '_')}@example.com"
user2 = User.create(name: user2_name, email: user2_email)
3.times do
  condition_name = CONDITIONS.sample
  condition = Condition.create(user: user2, name: condition_name)

  2.times do
    doctor = Doctor.create(
      condition: condition,
      name: Faker::DcComics.name,
      address: Faker::Address.full_address,
      phone: Faker::PhoneNumber.phone_number,
      category: Faker::Job.field
    )

    medication = Medication.create(
      condition: condition,
      name: Faker::Cannabis.strain,
      date_prescribed: Faker::Date.between(from: 5.years.ago, to: Date.today),
      dosage: "100mg",
      frequency: "daily",
      prescribed_by: doctor.name
    )

    HealthEvent.create(
      condition: condition,
      note: Faker::Cannabis.medical_use,
      date: Faker::Date.between(from: 1.year.ago, to: Date.today),
      category: Faker::Number.between(from: 0, to: 2) # Adjust
			)
		end
	end