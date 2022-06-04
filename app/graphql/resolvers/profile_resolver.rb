# frozen_string_literal: true

module Resolvers
  class ProfileResolver < BaseResolver
    type Types::ProfileType, null: true

    def resolve
      current_user.profile
    end
  end
end
