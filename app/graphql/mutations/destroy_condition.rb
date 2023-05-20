module Mutations
  class DestroyCondition < BaseMutation
    argument :id, Integer, required: true

    field :success, Boolean, null: false
    field :errors, [String], null: true

    def resolve(id:)
      condition = Condition.find_by(id:)

      if condition
        if condition.destroy
          { success: true, errors: [] }
        else
          { success: false, errors: condition.errors.full_messages }
        end
      else
        { success: false, errors: ["Condition not found"] }
      end
    end
  end
end
