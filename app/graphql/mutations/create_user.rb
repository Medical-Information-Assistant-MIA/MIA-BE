module Mutations
  class CreateUser < BaseMutation
    argument :name, String, required: true
    argument :email, String, required: true

    field :user, Types::UsersType, null: true
    field :errors, [String], null: true

    def resolve(name:, email:)
      user = User.new(name:, email:)

      if user.save
        {
          user:,
          errors: []
        }
      else
        {
          user: nil,
          errors: user.errors.full_messages
        }
      end
    end
  end
end

# argument :input, Types::UserInputType, required: true

# field :user, Types::UsersType, null: false
# field :errors, [String], null: true

# def resolve(input:)
#   user = User.create(input.to_h)

#   if user.persisted?
#     { user: user }
#   else
#     { errors: user.errors.full_messages }
#   end
# end
