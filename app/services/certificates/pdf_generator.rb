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
        attached && rails_blob_path(certificate_object.certificate_pdf_download, only_path: true)
      end

      create_png(rails_blob_path(certificate_object.certificate_pdf_download, only_path: true))
      upload_image!(certificate_object.certificate_png)
    end

    private

    def certificate_object
      # current_user.certificates.find(certificate_id)
      Certificate.find(certificate_id)
    end

    def create_png(pdf)
      pdf_path = "https://young-hollows-48335.herokuapp.com#{pdf}"
      pdf = MiniMagick::Image.open pdf_path

      MiniMagick::Tool::Convert.new do |convert|
        convert.background 'white'
        convert.flatten
        convert.density 150
        convert.quality 100
        convert << pdf.pages.first.path
        convert << 'png8:certificate.png'
      end
    end

    def upload_image!(object)
      object.attach(io: file, filename: file.original_filename, content_type: file.content_type)

      rails_blob_path(object, only_path: true)
    end

    def file
      ActionDispatch::Http::UploadedFile.new(
        type: 'images/png',
        filename: 'certificate.png'.to_s,
        tempfile: File.open(Rails.root.join('certificate.png'))
      )
    end
  end
end
