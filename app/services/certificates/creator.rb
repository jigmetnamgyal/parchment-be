# frozen_string_literal: true

module Certificates
  class Creator < BaseService
    attr_accessor :file

    def call
      Certificate.create!(certificate_attributes(attributes))
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
