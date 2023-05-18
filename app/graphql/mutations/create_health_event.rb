module Mutations
  class CreateHealthEvent < BaseMutation
    argument :note, String, required: true
    argument :date, String, required: true
    argument :category, String, required: true
    argument :conditionId, Integer, required: true

    field :health_event, Types::HealthEventsType, null: true
    field :errors, [String], null: true

    def resolve(note:, conditionId:, date:, category:)
      health_event = HealthEvent.new(note:, condition_id: conditionId, date:, category:)

      if health_event.save
        {
          health_event:,
          errors: []
        }
      else
        {
          health_event: nil,
          errors: health_event.errors.full_messages
        }
      end
    end
  end
end
