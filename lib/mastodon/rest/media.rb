require 'mastodon/rest/utils'
require 'mastodon/media'

module Mastodon
  module REST
    module Media
      include Mastodon::REST::Utils

      # Upload a media file
      # @param file [File, StringIO, HTTP::FormData::File] file to
      #   upload. Will be converted to HTTP::FormData::File before upload
      # @param description [String] A text description of the image, to be
      #   along with the image.
      # @return [Mastodon::Media]
      def upload_media(file, description = nil)
        file = file.is_a?(HTTP::FormData::File) ? file : HTTP::FormData::File.new(file)
        payload = { file: file }
        payload.merge!(description: description) unless description.nil?
        perform_request_with_object(:post, '/api/v1/media', payload, Mastodon::Media)
      end
    end
  end
end
