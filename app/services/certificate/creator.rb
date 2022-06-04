# frozen_string_literal: true

module Certificate
  class Creator < BaseService
    attr_accessor :file

    def call
      @file = attributes.delete(:institution_logo)

      Certificate.new(certificate_attributes(attributes)).tap do |certificate|
        certificate.institution_logo.attach(blob)
        certificate.institution_logo_url = rails_blob_path(certificate.institution_logo)
        certificate.save!
      end
    end

    private

    def blob
      @blob ||= ActiveStorage::Blob.create_and_upload!(
        io: file,
        filename: file.original_filename,
        content_type: file.content_type
      )
    end

    def certificate_attributes(attributes)
      attributes.merge!(user: current_user)
    end
  end
end
