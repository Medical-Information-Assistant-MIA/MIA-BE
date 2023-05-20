require "rails_helper"
require "action_dispatch"

module Queries
  module Users
    RSpec.describe User, type: :request do
      include ActionDispatch::Integration::RequestHelpers
      include RSpec::Rails::RequestExampleGroup

      describe ".resolve" do
        it "gets a user" do
          user = create(:user)
          keys = %i[id name email conditions]

          post "/graphql", params: { query: query(user.id) }

          data = JSON.parse(response.body, symbolize_names: true)

          expect(response).to be_successful
          expect(data[:data][:user].keys).to eq(keys)
        end
      end

      def query(id)
        <<~GQL
             {
               user(id: #{id}) {
                 id
                 name
          email
                 conditions {
                   name
                 }
               }
             }
        GQL
      end
    end
  end
end
