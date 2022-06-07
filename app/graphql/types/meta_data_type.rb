# frozen_string_literal: true

module Types
  class MetaDataType < BaseObject
    field :id, ID, null: false
    field :image_url, String, null: false
    field :description, String, null: false
    field :name, String, null: false
    field :triats, [Types::Triats], null: false
  end
end
