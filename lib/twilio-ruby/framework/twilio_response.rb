# frozen_string_literal: true

module Textgrid
  class TwilioResponse
    attr_accessor :status_code, :body

    # @deprecated Use 'Textgrid::Response' instead.
    def initialize(status_code, body)
      warn "'Textgrid::TwilioResponse' has been deprecated. Use 'Textgrid::Response' instead."
      response = Textgrid::Response.new(status_code, body)
      @status_code = response.status_code
      @body = response.body
    end

    def to_s
      "[#{@status_code}] #{@body}"
    end
  end
end
