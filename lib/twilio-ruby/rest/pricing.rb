##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Textgrid
  module REST
    class Pricing < Domain
      ##
      # Initialize the Pricing Domain
      def initialize(twilio)
        super

        @base_url = 'https://pricing.twilio.com'
        @host = 'pricing.twilio.com'
        @port = 443

        # Versions
        @v1 = nil
        @v2 = nil
      end

      ##
      # Version v1 of pricing
      def v1
        @v1 ||= V1.new self
      end

      ##
      # Version v2 of pricing
      def v2
        @v2 ||= V2.new self
      end

      ##
      # @return [Textgrid::REST::Pricing::V1::MessagingInstance]
      def messaging
        self.v1.messaging()
      end

      ##
      # @return [Textgrid::REST::Pricing::V1::PhoneNumberInstance]
      def phone_numbers
        self.v1.phone_numbers()
      end

      ##
      # @return [Textgrid::REST::Pricing::V2::VoiceInstance]
      def voice
        self.v2.voice()
      end

      ##
      # @param [String] iso_country The {ISO country
      #   code}[https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2].
      # @return [Textgrid::REST::Pricing::V2::CountryInstance] if iso_country was passed.
      # @return [Textgrid::REST::Pricing::V2::CountryList]
      def countries(iso_country=:unset)
        self.v2.countries(iso_country)
      end

      ##
      # @param [String] destination_number The destination phone number in
      #   {E.164}[https://www.twilio.com/docs/glossary/what-e164] format, which consists
      #   of a + followed by the country code and subscriber number.
      # @return [Textgrid::REST::Pricing::V2::NumberInstance] if destination_number was passed.
      # @return [Textgrid::REST::Pricing::V2::NumberList]
      def numbers(destination_number=:unset)
        self.v2.numbers(destination_number)
      end

      ##
      # Provide a user friendly representation
      def to_s
        '#<Textgrid::REST::Pricing>'
      end
    end
  end
end
