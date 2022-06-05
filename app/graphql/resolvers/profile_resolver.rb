# frozen_string_literal: true

module Resolvers
  class ProfileResolver < BaseResolver
    argument :id, ID, required: false
    type Types::ProfileType, null: true

    def resolve(id: nil)
      id.nil? ? current_user.profile : Profile.find(id)
    end
  end
end
