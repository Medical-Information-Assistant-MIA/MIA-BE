require "rails_helper"

module Mutations
  module Users
    RSpec.describe UpdateUser, type: :request do
      describe ".resolve" do
        it "updates a user" do
          user = create(:user)

          expect(user.name).to_not eq("Brad")
          expect(user.email).to_not eq("brad@brad.com")

          post "/graphql", params: { query: query(id: user.id, name: "Brad", email: "brad@brad.com") }
          data = JSON.parse(response.body, symbolize_names: true)

          expect(response).to be_successful
          expect(data[:data]).to have_key(:updateUser)
          expect(data[:data][:updateUser].keys).to eq(%i[user errors])
          expect(data[:data][:updateUser][:user][:id]).to be_a(Integer)
          expect(data[:data][:updateUser][:user][:name]).to eq("Brad")
          expect(data[:data][:updateUser][:user][:email]).to eq("brad@brad.com")
        end
      end

      describe "error response" do
        it "renders an error if a required field is not provided" do
          expect(User.count).to eq(0)

          post "/graphql", params: { query: query(id: 1, name: nil, email: "nil@nil.com") }
          data = JSON.parse(response.body, symbolize_names: true)

          expect(data[:data][:updateUser][:errors]).to eq(["user-not-found"])
        end
      end

      def query(id:, name:, email:)
        <<~GQL
             mutation {
               updateUser(input: {
          id: #{id}
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
