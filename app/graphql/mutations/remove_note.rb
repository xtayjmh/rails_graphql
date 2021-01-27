module Mutations
  class RemoveNote < Mutations::BaseMutation

    field :note, Types::NoteType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      note = Note.find(id)
      begin
        note.destroy!
        { note: note }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
