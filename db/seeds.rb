require 'faker'
require 'net/http'
require 'json'

CONDITIONS = [
  'Hypertension',
  'Diabetes',
  'Asthma',
  'Arthritis',
  'Depression',
  'Migraine',
  'Allergies',
  'Insomnia',
  'Bronchitis',
  'Gastritis'
].freeze

def fetch_random_medication_name
  url = URI('https://api.fda.gov/drug/label.json?count=openfda.brand_name.exact&limit=50')

  response = Net::HTTP.get(url)
  data = JSON.parse(response)

  medication_names = data['results'].map { |result| result['term'] } if data['results']
  medication_names || []
rescue StandardError => e
  puts "Failed to fetch medication names from the API: #{e.message}"
  []
end

def unique_random_medication_name(existing_names)
  all_medication_names = fetch_random_medication_name
  available_names = all_medication_names - existing_names
  available_names.sample || 'Unknown Medication'
end

def seed_data
  # Create User 1 with Conditions, Doctors, Medications, and Health Events
  user1_name = Faker::DcComics.villain
  user1_email = "#{user1_name.downcase.tr(' ', '_')}@example.com"
  user1 = User.create(name: user1_name, email: user1_email)

  existing_medication_names = []
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

      medication_name = unique_random_medication_name(existing_medication_names)
      existing_medication_names << medication_name

      medication = Medication.create(
        condition: condition,
        name: medication_name,
        date_prescribed: Faker::Date.between(from: 5.years.ago, to: Date.today),
        dosage: '100mg',
        frequency: 'daily',
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

  existing_medication_names = []
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

      medication_name = unique_random_medication_name(existing_medication_names)
      existing_medication_names << medication_name

      medication = Medication.create(
        condition: condition,
        name: medication_name,
        date_prescribed: Faker::Date.between(from: 5.years.ago, to: Date.today),
        dosage: '100mg',
        frequency: 'daily',
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
end

seed_data
