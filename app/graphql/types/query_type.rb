# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false, description: "An example field added by the generator"

		field :user, Types::UsersType, null: false do
			argument :id, Integer, required: true
		end

		field :users, [Types::UsersType], null: false

		def user(id:)
			User.find(id)
		end

		def users
			User.all
		end
  end
end
