##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Textgrid
  module REST
    class IpMessaging < Domain
      ##
      # Initialize the IpMessaging Domain
      def initialize(twilio)
        super

        @base_url = 'https://ip-messaging.twilio.com'
        @host = 'ip-messaging.twilio.com'
        @port = 443

        # Versions
        @v1 = nil
        @v2 = nil
      end

      ##
      # Version v1 of ip_messaging
      def v1
        @v1 ||= V1.new self
      end

      ##
      # Version v2 of ip_messaging
      def v2
        @v2 ||= V2.new self
      end

      ##
      # @param [String] sid The sid
      # @return [Textgrid::REST::Ip_messaging::V2::CredentialInstance] if sid was passed.
      # @return [Textgrid::REST::Ip_messaging::V2::CredentialList]
      def credentials(sid=:unset)
        self.v2.credentials(sid)
      end

      ##
      # @param [String] sid The sid
      # @return [Textgrid::REST::Ip_messaging::V2::ServiceInstance] if sid was passed.
      # @return [Textgrid::REST::Ip_messaging::V2::ServiceList]
      def services(sid=:unset)
        self.v2.services(sid)
      end

      ##
      # Provide a user friendly representation
      def to_s
        '#<Textgrid::REST::IpMessaging>'
      end
    end
  end
end
