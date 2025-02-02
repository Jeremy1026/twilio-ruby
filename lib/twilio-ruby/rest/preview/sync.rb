##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Textgrid
  module REST
    class Preview
      class Sync < Version
        ##
        # Initialize the Sync version of Preview
        def initialize(domain)
          super
          @version = 'Sync'
          @services = nil
        end

        ##
        # @param [String] sid The sid
        # @return [Textgrid::REST::Preview::Sync::ServiceContext] if sid was passed.
        # @return [Textgrid::REST::Preview::Sync::ServiceList]
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
          '<Textgrid::REST::Preview::Sync>'
        end
      end
    end
  end
end
