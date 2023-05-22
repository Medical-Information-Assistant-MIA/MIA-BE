require "rails_helper"

module Mutations
  module Users
    RSpec.describe DestroyUser, type: :request do
      describe ".resolve" do
        it "destroys a User" do
          user = create(:user)
          expect(User.count).to eq(1)

          post "/graphql", params: { query: query(id: user.id) }
          data = JSON.parse(response.body, symbolize_names: true)

          expect(response).to be_successful
          expect(data[:data][:destroyUser][:success]).to eq(true)
          expect(User.count).to eq(0)
        end
      end

      describe "error responses" do
        it "renders an error if a User id does not exist" do
          user = create(:user)
          expect(User.count).to eq(1)

          post "/graphql", params: { query: query(id: 333) }
          data = JSON.parse(response.body, symbolize_names: true)

          expect(data[:data][:destroyUser][:errors]).to eq(["User not found"])
          expect(data[:data][:destroyUser][:success]).to eq(false)
          expect(User.count).to eq(1)
        end

        it "renders an error if the deletion fails" do
          user = create(:user)
          expect(User.count).to eq(1)

          allow(User).to receive(:find_by).and_return(user)
          allow(user).to receive(:destroy).and_return(false)
          allow(user).to receive_message_chain(:errors, :full_messages).and_return(["User deletion failed"])

          post "/graphql", params: { query: query(id: user.id) }
          data = JSON.parse(response.body, symbolize_names: true)

          expect(data[:data][:destroyUser][:errors]).to eq(["User deletion failed"])
          expect(data[:data][:destroyUser][:success]).to eq(false)
        end
      end

      def query(id:)
        <<~GQL
          mutation {
            destroyUser(input: {
              id: #{id}
            }) {
              errors
              success
            }
          }
        GQL
      end
    end
  end
end
