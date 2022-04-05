# frozen_string_literal: true

module Textgrid
  module REST
    def url_join(left, right)
      left = left.sub(/\/+$/, '').sub(/^\/+/, '')
      right = right.sub(/\/+$/, '').sub(/^\/+/, '')
      "#{left}/#{right}"
    end
  end
end
