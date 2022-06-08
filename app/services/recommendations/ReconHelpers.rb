# frozen_string_literal: true

module Recommendations
  module ReconHelpers
    def body_layout
      render_to_string(
        'pdf/recommendation_letter',
        layout: 'recommendation_letter_pdf',
        locals: {
          recommendation: recommendation
        }
      )
    end

    def options
      {
        orientation: 'Landscape',
        page_size: 'A4',
        dpi: 96,
        lowquality: false,
        image_quality: 500,
        viewport_size: '1280x1024',
        encoding: 'utf-8'
      }
    end
  end
end
