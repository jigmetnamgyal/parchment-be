# frozen_string_literal: true

module Mutations
  class UpdateKycStatus < BaseMutation
    class UpdateKycStatusAttributes < Types::BaseInputObject
      argument :id, ID, required: true
      argument :kyc_status, Types::KycStatusEnum, required: true
    end

    argument :attributes, UpdateKycStatusAttributes, required: true
    type Types::ProfileType

    def resolve(attributes:)
      Profile.find(attributes.to_h[:id]).tap do |profile|
        profile.update!(kyc_status: attributes.to_h[:kyc_status])
      end
    end
  end
end
