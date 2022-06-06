# frozen_string_literal: true

module Certificates
  module Helpers
    def body_layout
      render_to_string(
        'pdf/certificate',
        layout: 'certificate_pdf',
        locals: { certificate: certificate }
      )
    end

    def options
      {
        orientation: 'Portrait',
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
