# frozen_string_literal: true

module Certificates
  class PdfGeneratorHelper
    include Helpers

    attr_accessor :certificate

    def initialize(id:)
      @certificate = Certificate.find(id)
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
