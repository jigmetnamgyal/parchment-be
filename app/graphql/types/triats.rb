# frozen_string_literal: true

module Types
  class Triats < BaseObject
    field :trait_type, ID, null: false
    field :value, String, null: false
  end
end
