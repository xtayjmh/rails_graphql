module Types
  class MutationType < Types::BaseObject
    field :remove_note, mutation: Mutations::RemoveNote
    field :add_note, mutation: Mutations::AddNote
  end
end
