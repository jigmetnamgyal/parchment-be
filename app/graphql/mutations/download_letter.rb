# frozen_string_literal: true

module Mutations
  class DownloadLetter < BaseMutation
    argument :recommendation_letter_id, ID, required: true
    field :url, String, null: true

    def resolve(recommendation_letter_id:)
      {
        url: Recommendations::GenerateLetterPdf.new(
          current_user: current_user, recommendation_letter_id: recommendation_letter_id
        ).call
      }
    end
  end
end
