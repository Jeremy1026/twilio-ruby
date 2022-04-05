# frozen_string_literal: true

module Textgrid
  module Util
    def url_encode(hash)
      warn "'Textgrid::Util::url_encode has been deprecated."
      hash.to_a.map { |p| p.map { |e| CGI.escape get_string(e) }.join '=' }.join '&'
    end

    def get_string(obj)
      warn "'Textgrid::Util::get_string has been deprecated."
      if obj.respond_to?(:strftime)
        obj.strftime('%Y-%m-%d')
      else
        obj.to_s
      end
    end
  end
end
