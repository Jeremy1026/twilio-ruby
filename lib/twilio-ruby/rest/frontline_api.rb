##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Textgrid
  module REST
    class FrontlineApi < Domain
      ##
      # Initialize the FrontlineApi Domain
      def initialize(twilio)
        super

        @base_url = 'https://frontline-api2.textgrid.com'
        @host = 'frontline-api2.textgrid.com'
        @port = 443

        # Versions
        @v1 = nil
      end

      ##
      # Version v1 of frontline_api
      def v1
        @v1 ||= V1.new self
      end

      ##
      # @param [String] sid The unique string that we created to identify the User
      #   resource.
      # @return [Textgrid::REST::Frontline_api::V1::UserInstance] if sid was passed.
      # @return [Textgrid::REST::Frontline_api::V1::UserList]
      def users(sid=:unset)
        self.v1.users(sid)
      end

      ##
      # Provide a user friendly representation
      def to_s
        '#<Textgrid::REST::FrontlineApi>'
      end
    end
  end
end
