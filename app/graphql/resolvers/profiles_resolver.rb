# frozen_string_literal: true

module Resolvers
  class ProfilesResolver < BaseResolver
    argument :kyc_status, Types::KycStatusEnum, required: false
    type [Types::ProfileType], null: true

    def resolve(kyc_status: nil)
      kyc_status.nil? ? Profile.all : Profile.where(kyc_status: kyc_status)
    end
  end
end
