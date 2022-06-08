# frozen_string_literal: true

module Recommendations
  class GenerateLetterPdf < BaseService
    attr_accessor :recommendation_letter_id

    def call
      recommendation_object.recommendation_png.attach(
        io: StringIO.new(
          Recommendations::PdfGenHelper.new(id: recommendation_letter_id).generate
        ),
        filename: "recommendation_letter(#{Time.current.strftime('%d/%m/%Y %H:%M:%S')}).pdf",
        content_type: 'application/pdf'
      ).then do |attached|
        attached && rails_blob_path(recommendation_object.recommendation_png, only_path: true)
      end
    end

    private

    def recommendation_object
      Recommendation.find(recommendation_letter_id)
    end
  end
end
