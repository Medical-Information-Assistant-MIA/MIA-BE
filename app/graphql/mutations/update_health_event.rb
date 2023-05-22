module Mutations
  class UpdateHealthEvent < BaseMutation
    argument :note, String, required: false
    argument :date, String, required: false
    argument :category, String, required: false
    argument :conditionId, Integer, required: false
    argument :id, Integer, required: true

    field :health_event, Types::HealthEventsType, null: true
    field :errors, [String], null: true
    field :success, Boolean, null: true


    def resolve(id:, **args)
      health_event = HealthEvent.find(id)

      if health_event.update(args)
        { success: true, health_event:, errors: [] }
      else
        { success: false, health_event: nil, errors: health_event.errors.full_messages }
      end
    rescue ActiveRecord::RecordNotFound
      { success: false, health_event: nil, errors: ["Health Event not found"] }
    end
  end
end
