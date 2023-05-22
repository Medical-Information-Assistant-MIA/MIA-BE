module Mutations
  class DestroyHealthEvent < BaseMutation
    argument :id, Integer, required: true

    field :success, Boolean, null: false
    field :errors, [String], null: true

    def resolve(id:)
      health_event = HealthEvent.find_by(id:)

      if health_event
        if health_event.destroy
          { success: true, errors: [] }
        else
          { success: false, errors: health_event.errors.full_messages }
        end
      else
        { success: false, errors: ["HealthEvent not found"] }
      end
    end
  end
end
