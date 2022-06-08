# frozen_string_literal: true

module Types
  class RecommendationType < BaseObject
    field :id, ID, null: false
    field :message, String, null: false
  end
end
