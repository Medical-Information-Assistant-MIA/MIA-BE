# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :user, Types::UsersType, null: false do
      argument :id, Integer, required: true
    end

    field :users, [Types::UsersType], null: false

    field :condition, Types::ConditionsType, null: false do
      argument :id, Integer, required: true
    end

    field :user_conditions, [Types::ConditionsType], null: false do
      argument :userId, Integer, required: true
    end

    field :condition_doctors, [Types::DoctorsType], null: false do
      argument :conditionId, Integer, required: true
    end

    field :condition_medications, [Types::MedicationsType], null: false do
      argument :conditionId, Integer, required: true
    end

    field :condition_health_events, [Types::HealthEventsType], null: false do
      argument :conditionId, Integer, required: true
    end

		field :user_doctors, [Types::DoctorsType], null: false do
			argument :userId, Integer, required: true
		end

    def user(id:)
      User.find(id)
    end

    def users
      User.all
    end

    def condition(id:)
      condition = Condition.find(id)
    rescue ActiveRecord::RecordNotFound
    end

    def user_conditions(userId:)
      User.find(userId).conditions
    end

    def condition_doctors(conditionId:)
      Condition.find(conditionId).doctors
    end

    def condition_medications(conditionId:)
      Condition.find(conditionId).medications
    end

    def condition_health_events(conditionId:)
      Condition.find(conditionId).health_events
    end

		def user_doctors(userId:)
			User.find(userId).doctors.uniq
		end
  end
end
