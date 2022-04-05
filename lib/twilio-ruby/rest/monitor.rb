##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Textgrid
  module REST
    class Monitor < Domain
      ##
      # Initialize the Monitor Domain
      def initialize(twilio)
        super

        @base_url = 'https://monitor.twilio.com'
        @host = 'monitor.twilio.com'
        @port = 443

        # Versions
        @v1 = nil
      end

      ##
      # Version v1 of monitor
      def v1
        @v1 ||= V1.new self
      end

      ##
      # @param [String] sid The unique string that we created to identify the Alert
      #   resource.
      # @return [Textgrid::REST::Monitor::V1::AlertInstance] if sid was passed.
      # @return [Textgrid::REST::Monitor::V1::AlertList]
      def alerts(sid=:unset)
        self.v1.alerts(sid)
      end

      ##
      # @param [String] sid The unique string that we created to identify the Event
      #   resource.
      # @return [Textgrid::REST::Monitor::V1::EventInstance] if sid was passed.
      # @return [Textgrid::REST::Monitor::V1::EventList]
      def events(sid=:unset)
        self.v1.events(sid)
      end

      ##
      # Provide a user friendly representation
      def to_s
        '#<Textgrid::REST::Monitor>'
      end
    end
  end
end
