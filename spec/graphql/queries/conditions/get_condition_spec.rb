require 'rails_helper'

  module Queries
    module Conditions
      RSpec.describe Condition, type: :request do
        describe '.resolve' do
          it 'gets a condition' do
            user = create(:user)
            condition = create(:condition, user_id: user.id)
            doctor = create(:doctor, condition_id: condition.id)
            health_event = create(:health_event, condition_id: condition.id, category: "doctor_visit")
            medication = create(:medication, condition_id: condition.id)
            keys = [:id, :userId, :name, :medications, :doctors, :healthEvents]
            doctor_keys = [:name, :phone, :address, :category]
            health_event_keys = [:date, :note, :category]
            medication_keys = [:name, :datePrescribed, :dosage, :frequency, :prescribedBy]
            
            post '/graphql', params: { query: query(condition.id) }
    
            data = JSON.parse(response.body, symbolize_names: true)
     
            expect(response).to be_successful
            expect(data[:data][:condition].keys).to eq(keys)
            expect(data[:data][:condition][:doctors].first.keys).to eq(doctor_keys)
            expect(data[:data][:condition][:healthEvents].first.keys).to eq(health_event_keys)
            expect(data[:data][:condition][:medications].first.keys).to eq(medication_keys)
          end

          it "shows an error if the condition doesn't exist" do
            user = create(:user)
            condition = create(:condition, user_id: user.id)
            doctor = create(:doctor, condition_id: condition.id)
            health_event = create(:health_event, condition_id: condition.id, category: "doctor_visit")
            medication = create(:medication, condition_id: condition.id)
            keys = [:id, :userId, :name, :medications, :doctors, :healthEvents]
            doctor_keys = [:name, :phone, :address, :category]
            health_event_keys = [:date, :note, :category]
            medication_keys = [:name, :datePrescribed, :dosage, :frequency, :prescribedBy]
            
            post '/graphql', params: { query: query(2) }
    
            data = JSON.parse(response.body, symbolize_names: true)
      
            expect(response).to be_successful
            expect(data[:data]).to eq(nil)
            expect(data).to have_key(:errors)
          end

        def query(id)
          <<~GQL
          {
            condition(id: #{id}) {
                id
                userId
                name
                medications {
                    name
                    datePrescribed
                    dosage
                    frequency
                    prescribedBy
                }  
                doctors {
                    name
                    phone
                    address
                    category
                }
                healthEvents {
                    date
                    note
                    category
                }
            }
          }
          GQL
        end
      end
    end
  end
end