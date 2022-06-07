# frozen_string_literal: true

module Mutations
  class CreateMetaData < BaseMutation
    class CreateMetaDataAttributes < Types::BaseInputObject
      argument :image_url, String, required: true
      argument :description, String, required: true
      argument :name, String, required: true
      argument :traits, [Types::AttributesType], required: true
    end

    argument :attributes, CreateMetaDataAttributes, required: true
    type Types::MetaDataType

    def resolve(attributes:)
      MetaDatum.create!(attributes.to_h)
    end
  end
end
