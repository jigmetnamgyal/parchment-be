# frozen_string_literal: true

module Certificates
  class PdfGenerator < BaseService
    attr_accessor :certificate_id

    def call
      certificate_object.certificate_pdf_download.attach(
        io: StringIO.new(PdfGeneratorHelper.new(id: certificate_id).generate),
        filename: "certificate(#{Time.current.strftime('%d/%m/%Y %H:%M:%S')}).pdf",
        content_type: 'application/pdf'
      ).then do |attached|
        attached && url_for(certificate_object.certificate_pdf_download)
      end
    end

    private

    def certificate_object
      current_user.certificates.find(certificate_id)
    end
  end
end
