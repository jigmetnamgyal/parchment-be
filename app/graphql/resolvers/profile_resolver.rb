# frozen_string_literal: true

module Resolvers
  class ProfileResolver < BaseResolver
    argument :id, ID, required: true
    type Types::ProfileType, null: true

    def resolve(id:)
      Profile.find(id)
    end
  end
end
