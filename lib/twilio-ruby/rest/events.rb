##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Textgrid
  module REST
    class Events < Domain
      ##
      # Initialize the Events Domain
      def initialize(twilio)
        super

        @base_url = 'https://events.twilio.com'
        @host = 'events.twilio.com'
        @port = 443

        # Versions
        @v1 = nil
      end

      ##
      # Version v1 of events
      def v1
        @v1 ||= V1.new self
      end

      ##
      # @param [String] type A string that uniquely identifies this Event Type.
      # @return [Textgrid::REST::Events::V1::EventTypeInstance] if type was passed.
      # @return [Textgrid::REST::Events::V1::EventTypeList]
      def event_types(type=:unset)
        self.v1.event_types(type)
      end

      ##
      # @param [String] id The unique identifier of the schema. Each schema can have
      #   multiple versions, that share the same id.
      # @return [Textgrid::REST::Events::V1::SchemaInstance] if id was passed.
      # @return [Textgrid::REST::Events::V1::SchemaList]
      def schemas(id=:unset)
        self.v1.schemas(id)
      end

      ##
      # @param [String] sid A 34 character string that uniquely identifies this Sink.
      # @return [Textgrid::REST::Events::V1::SinkInstance] if sid was passed.
      # @return [Textgrid::REST::Events::V1::SinkList]
      def sinks(sid=:unset)
        self.v1.sinks(sid)
      end

      ##
      # @param [String] sid A 34 character string that uniquely identifies this
      #   Subscription.
      # @return [Textgrid::REST::Events::V1::SubscriptionInstance] if sid was passed.
      # @return [Textgrid::REST::Events::V1::SubscriptionList]
      def subscriptions(sid=:unset)
        self.v1.subscriptions(sid)
      end

      ##
      # Provide a user friendly representation
      def to_s
        '#<Textgrid::REST::Events>'
      end
    end
  end
end
