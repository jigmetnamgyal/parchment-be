# frozen_string_literal: true

module Mutations
  class SendForKyc < BaseMutation
    class SendForKycAttributes < Types::BaseInputObject
      argument :attributes, RevertTransitionAttributes, required: true
    end

    argument :attributes, SendForKycAttributes, required: true
    field :project, Types::ProjectType, null: true

    def resolve(attributes:); end
  end
end
