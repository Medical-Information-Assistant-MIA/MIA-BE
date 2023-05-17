module Mutations
	class CreateCondition < BaseMutation
		argument :name, String, required: true
		argument :userId, Integer, required: true

		field :condition, Types::ConditionsType, null: true
		field :errors, [String], null: true

		def resolve(name:, userId:)
			condition = Condition.new(name: name, user_id: userId)

			if condition.save
				{
					condition: condition,
					errors: []
				}
			else 
				{
					condition: nil,
					errors: condition.errors.full_messages
				}
			end
		end
	end
end
