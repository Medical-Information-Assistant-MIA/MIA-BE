require "rails_helper"

module Mutations
  module Users
    RSpec.describe CreateUser, type: :request do
      describe ".resolve" do
        it "creates a User" do
          expect(User.count).to eq(0)

          post "/graphql", params: { query: query(name: "Brad", email: "test@test.com") }
          data = JSON.parse(response.body, symbolize_names: true)

          expect(User.count).to eq(1)
          expect(response).to be_successful
          expect(data[:data]).to have_key(:createUser)
          expect(data[:data][:createUser].keys).to eq(%i[user errors])
          expect(data[:data][:createUser][:user][:id]).to be_a(Integer)
          expect(data[:data][:createUser][:user][:name]).to eq("Brad")
					expect(data[:data][:createUser][:user][:email]).to eq("test@test.com")
        
        end
      end
     

      def query(name:, email:)
        <<~GQL
          mutation {
            createUser(input: {
              name: "#{name}"
              email: "#{email}"
            }) {
              user {
                id
                name
                email
              }
              errors
            }
          }
        GQL
      end
    end
  end
end
