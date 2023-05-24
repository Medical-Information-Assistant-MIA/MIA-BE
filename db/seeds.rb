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

SPECIALTIES = [
	'Neurologist',
	'Cardiologist',
	'Primary Care',
	'Gastroenterologist',
	'Psychiatrist',
	'Urologist',
	'Pulmonologist',
	'Oncologist',
	'Endocrinologist',
	'Gynecologist',
	'Pediatrician',
	'Orthopedist',
	'Nephrologist',
	'Dermatologist',
	'Allergist'	
].freeze

def fetch_random_medication_names
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
  all_medication_names = fetch_random_medication_names
  available_names = all_medication_names - existing_names
  available_names.sample || 'Unknown Medication'
end

def create_user(name)
  email = "#{name.downcase.tr(' ', '_')}@example.com"
  User.create(name: name, email: email)
end

def create_condition(user)
  condition_name = CONDITIONS.sample
  Condition.create(user: user, name: condition_name)
end

def create_doctor(condition)
	doctor_category = SPECIALTIES.sample
  Doctor.create(
    condition: condition,
    name: "Dr. " + Faker::DcComics.name,
    address: Faker::Address.full_address,
    phone: Faker::PhoneNumber.phone_number,
    category: doctor_category
  )
end

def create_medication(condition, existing_medication_names, doctor)
  medication_name = unique_random_medication_name(existing_medication_names)
  existing_medication_names << medication_name

  Medication.create(
    condition: condition,
    name: medication_name,
    date_prescribed: Faker::Date.between(from: 5.years.ago, to: Date.today),
    dosage: '100mg',
    frequency: 'daily',
    prescribed_by: doctor.name
  )
end

def create_health_event(condition)
  HealthEvent.create(
    condition: condition,
    note: Faker::Cannabis.medical_use,
    date: Faker::Date.between(from: 1.year.ago, to: Date.today),
    category: Faker::Number.between(from: 0, to: 2) # Adjust range as per your category options
  )
end

def seed_data
  # Create User 1 with Conditions, Doctors, Medications, and Health Events
  user1 = create_user(Faker::DcComics.villain)

  existing_medication_names = []
  3.times do
    condition = create_condition(user1)

    2.times do
      doctor = create_doctor(condition)
      create_medication(condition, existing_medication_names, doctor)
      create_health_event(condition)
    end
  end

  # Create User 2 with Conditions, Doctors, Medications, and Health Events
  user2 = create_user(Faker::DcComics.villain)

  existing_medication_names = []
  3.times do
    condition = create_condition(user2)

    2.times do
      doctor = create_doctor(condition)
      create_medication(condition, existing_medication_names, doctor)
      create_health_event(condition)
    end
  end
end

seed_data
