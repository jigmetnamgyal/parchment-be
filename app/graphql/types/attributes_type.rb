# frozen_string_literal: true

module Types
  class AttributesType < Types::BaseInputObject
    argument :trait_type, String, required: true
    argument :value, String, required: true
  end
end
