module Mutations
  class UpdateCondition < BaseMutation
		argument :id, Integer, required: true
		argument :name, String, required: true
    argument :userId, String, required: false

    field :condition, Types::ConditionsType, null: true 
    field :errors, [String], null: true
    field :success, Boolean, null: true

    def resolve(id:, **args)
      condition = Condition.find(id)

      if condition.update(args)
        {success: true, condition: condition, errors: []}
      else 
        {success: false, condition: nil, errors: condition.errors.full_messages}
      end
    rescue ActiveRecord::RecordNotFound 
      return { success: false, condition: nil, errors: ["record-not-found"]}
    end
  end
end