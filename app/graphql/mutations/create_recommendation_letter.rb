# frozen_string_literal: true

module Mutations
  class CreateRecommendationLetter < BaseMutation
    class CreateRecommendationLetterAttributes < Types::BaseInputObject
      argument :message, String, required: true
    end

    argument :attributes, CreateRecommendationLetterAttributes, required: true
    type Types::RecommendationType

    def resolve(attributes:)
      Recommendations::Creator.new(current_user: current_user, attributes: attributes.to_h).call
    end
  end
end
