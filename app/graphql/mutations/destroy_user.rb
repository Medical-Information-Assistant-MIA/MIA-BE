module Mutations
  class DestroyUser < BaseMutation
    argument :id, Integer, required: true

    field :success, Boolean, null: false
    field :errors, [String], null: true

    def resolve(id:)
      user = User.find_by(id:)

      if user
        if user.destroy
          { success: true, errors: [] }
        else
          { success: false, errors: user.errors.full_messages }
        end
      else
        { success: false, errors: ["User not found"] }
      end
    end
  end
end
