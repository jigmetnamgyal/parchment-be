# frozen_string_literal: true

module Certificates
  class QrCertificateGenerator < BaseService
    def call
      generate_qr

      certificate_object.certificate_with_qr_download.attach(
        io: StringIO.new(PdfGeneratorHelper.new(id: attributes[:certificate_id]).generate),
        filename: "certificate_with_qr(#{Time.current.strftime('%d/%m/%Y %H:%M:%S')}).pdf",
        content_type: 'application/pdf'
      ).then do |attached|
        attached && rails_blob_path(certificate_object.certificate_with_qr_download, only_path: true)
      end
    end

    private

    def certificate_object
      current_user.certificates.find(certificate_id)
    end

    def generate_qr
      qrcode = RQRCode::QRCode.new(attributes[:qr_code_url])

      png = qrcode.as_png(
        bit_depth: 1,
        border_modules: 4,
        color_mode: ChunkyPNG::COLOR_GRAYSCALE,
        color: 'black',
        file: nil,
        fill: 'white',
        module_px_size: 6,
        resize_exactly_to: false,
        resize_gte_to: false,
        size: 120
      )

      IO.binwrite('opensea_qr.png', png.to_s)

      certificate_object.update!(
        qr_code_url: update_qr_code_link(certificate_object.opensea_qr)
      )
    end

    def update_qr_code_link(object)
      object.attach(io: file, filename: file.original_filename, content_type: file.content_type)

      rails_blob_path(object, only_path: true)
    end

    def file
      ActionDispatch::Http::UploadedFile.new(
        type: 'images/png',
        filename: 'qr.png'.to_s,
        tempfile: File.open(Rails.root.join('opensea_qr.png'))
      )
    end
  end
end
