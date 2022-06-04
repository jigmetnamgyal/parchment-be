# frozen_string_literal: true

module Resolvers
  class ProfilesResolver < BaseResolver
    type [Types::ProfileType], null: true

    def resolve
      Profile.all
    end
  end
end
