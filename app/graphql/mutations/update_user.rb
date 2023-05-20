module Mutations
  class UpdateUser < BaseMutation
    argument :id, Integer, required: true
    argument :name, String, required: true
    argument :email, String, required: true

    field :user, Types::UsersType, null: true
    field :errors, [String], null: true

    def resolve(id:, **args)
      user = User.find(id)

      if user.update(args)
        { success: true, user:, errors: [] }
      else
        { success: false, user: nil, errors: user.errors.full_messages }
      end
    rescue ActiveRecord::RecordNotFound
      { success: false, user: nil, errors: ["user-not-found"] }
    end
  end
end
