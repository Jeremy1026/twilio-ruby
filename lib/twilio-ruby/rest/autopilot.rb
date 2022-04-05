##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Textgrid
  module REST
    class Autopilot < Domain
      ##
      # Initialize the Autopilot Domain
      def initialize(twilio)
        super

        @base_url = 'https://autopilot.twilio.com'
        @host = 'autopilot.twilio.com'
        @port = 443

        # Versions
        @v1 = nil
      end

      ##
      # Version v1 of autopilot
      def v1
        @v1 ||= V1.new self
      end

      ##
      # @param [String] sid The unique string that we created to identify the Assistant
      #   resource.
      # @return [Textgrid::REST::Autopilot::V1::AssistantInstance] if sid was passed.
      # @return [Textgrid::REST::Autopilot::V1::AssistantList]
      def assistants(sid=:unset)
        self.v1.assistants(sid)
      end

      ##
      # @return [Textgrid::REST::Autopilot::V1::RestoreAssistantInstance]
      def restore_assistant
        self.v1.restore_assistant()
      end

      ##
      # Provide a user friendly representation
      def to_s
        '#<Textgrid::REST::Autopilot>'
      end
    end
  end
end
