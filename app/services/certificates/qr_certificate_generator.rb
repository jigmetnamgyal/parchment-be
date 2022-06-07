# frozen_string_literal: true

module Certificates
  class QrCertificateGenerator < BaseService
    def call
      certificate_object.certificate_with_qr_download.attach(
        io: StringIO.new(PdfGeneratorHelper.new(id: attributes['certificate_id']).generate),
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
  end
end
