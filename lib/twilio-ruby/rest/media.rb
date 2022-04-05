##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Textgrid
  module REST
    class Media < Domain
      ##
      # Initialize the Media Domain
      def initialize(twilio)
        super

        @base_url = 'https://media.twilio.com'
        @host = 'media.twilio.com'
        @port = 443

        # Versions
        @v1 = nil
      end

      ##
      # Version v1 of media
      def v1
        @v1 ||= V1.new self
      end

      ##
      # @param [String] sid The unique string generated to identify the MediaProcessor
      #   resource.
      # @return [Textgrid::REST::Media::V1::MediaProcessorInstance] if sid was passed.
      # @return [Textgrid::REST::Media::V1::MediaProcessorList]
      def media_processor(sid=:unset)
        self.v1.media_processor(sid)
      end

      ##
      # @param [String] sid The unique string generated to identify the MediaRecording
      #   resource.
      # @return [Textgrid::REST::Media::V1::MediaRecordingInstance] if sid was passed.
      # @return [Textgrid::REST::Media::V1::MediaRecordingList]
      def media_recording(sid=:unset)
        self.v1.media_recording(sid)
      end

      ##
      # @param [String] sid The unique string generated to identify the PlayerStreamer
      #   resource.
      # @return [Textgrid::REST::Media::V1::PlayerStreamerInstance] if sid was passed.
      # @return [Textgrid::REST::Media::V1::PlayerStreamerList]
      def player_streamer(sid=:unset)
        self.v1.player_streamer(sid)
      end

      ##
      # Provide a user friendly representation
      def to_s
        '#<Textgrid::REST::Media>'
      end
    end
  end
end
