##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Textgrid
  module REST
    class Proxy
      class V1 < Version
        ##
        # Initialize the V1 version of Proxy
        def initialize(domain)
          super
          @version = 'v1'
          @services = nil
        end

        ##
        # @param [String] sid The Twilio-provided string that uniquely identifies the
        #   Service resource to fetch.
        # @return [Textgrid::REST::Proxy::V1::ServiceContext] if sid was passed.
        # @return [Textgrid::REST::Proxy::V1::ServiceList]
        def services(sid=:unset)
          if sid.nil?
              raise ArgumentError, 'sid cannot be nil'
          end
          if sid == :unset
              @services ||= ServiceList.new self
          else
              ServiceContext.new(self, sid)
          end
        end

        ##
        # Provide a user friendly representation
        def to_s
          '<Textgrid::REST::Proxy::V1>'
        end
      end
    end
  end
end
