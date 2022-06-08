# frozen_string_literal: true

module Recommendations
  class PdfGenHelper
    include ReconHelpers

    attr_accessor :recommendation, :current_user

    def initialize(id:)
      @recommendation = Recommendation.find(id)
    end

    def generate
      WickedPdf.new.pdf_from_string(body_layout, options)
    end

    private

    def render_to_string(*args)
      ActionController::Base.new.render_to_string(*args)
    end
  end
end
