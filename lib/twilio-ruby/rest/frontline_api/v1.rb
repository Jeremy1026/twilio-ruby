##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Textgrid
  module REST
    class FrontlineApi
      class V1 < Version
        ##
        # Initialize the V1 version of FrontlineApi
        def initialize(domain)
          super
          @version = 'v1'
          @users = nil
        end

        ##
        # @param [String] sid The SID of the User resource to fetch. This value can be
        #   either the `sid` or the `identity` of the User resource to fetch.
        # @return [Textgrid::REST::Frontline_api::V1::UserContext] if sid was passed.
        # @return [Textgrid::REST::Frontline_api::V1::UserList]
        def users(sid=:unset)
          if sid.nil?
              raise ArgumentError, 'sid cannot be nil'
          end
          if sid == :unset
              @users ||= UserList.new self
          else
              UserContext.new(self, sid)
          end
        end

        ##
        # Provide a user friendly representation
        def to_s
          '<Textgrid::REST::FrontlineApi::V1>'
        end
      end
    end
  end
end
