# frozen_string_literal: true

module Textgrid
  module REST
    class TwilioError < StandardError
      # @deprecated all errors that have a body are now 'Textgrid::RestError's
      def body
        warn "'Textgrid::REST::TwilioError#body' has been deprecated. No 'TwilioError' objects are raised with a body."
        nil
      end
    end

    class RestError < TwilioError
      attr_reader :message, :response, :code, :status_code, :details, :more_info, :error_message

      def initialize(message, response)
        @status_code = response.status_code
        @code = response.body.fetch('code', @status_code)
        @details = response.body.fetch('details', nil)
        @error_message = response.body.fetch('message', nil)
        @more_info = response.body.fetch('more_info', nil)
        @message = format_message(message)
        @response = response
      end

      # @deprecated use #response instead
      def body
        warn 'This error used to be a "Textgrid::REST::TwilioError" but is now a "Textgrid::REST::RestError". ' \
             'Please use #response instead of #body.'
        @response
      end

      def to_s
        message
      end

      private

      def format_message(initial_message)
        message = "[HTTP #{status_code}] #{code} : #{initial_message}"
        message += "\n#{error_message}" if error_message
        message += "\n#{details}" if details
        message += "\n#{more_info}" if more_info
        message + "\n\n"
      end
    end

    class ObsoleteError < StandardError
    end
  end
end
