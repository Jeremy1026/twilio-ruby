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
      class V1 < Version
        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class UserList < ListResource
          ##
          # Initialize the UserList
          # @param [Version] version Version that contains the resource
          # @return [UserList] UserList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.FrontlineApi.V1.UserList>'
          end
        end

        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class UserPage < Page
          ##
          # Initialize the UserPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [UserPage] UserPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of UserInstance
          # @param [Hash] payload Payload response from the API
          # @return [UserInstance] UserInstance
          def get_instance(payload)
            UserInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.FrontlineApi.V1.UserPage>'
          end
        end

        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class UserContext < InstanceContext
          ##
          # Initialize the UserContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The SID of the User resource to fetch. This value can be
          #   either the `sid` or the `identity` of the User resource to fetch.
          # @return [UserContext] UserContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {sid: sid, }
            @uri = "/Users/#{@solution[:sid]}"
          end

          ##
          # Fetch the UserInstance
          # @return [UserInstance] Fetched UserInstance
          def fetch
            payload = @version.fetch('GET', @uri)

            UserInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Update the UserInstance
          # @param [String] friendly_name The string that you assigned to describe the User.
          # @param [String] avatar The avatar URL which will be shown in Frontline
          #   application.
          # @param [user.StateType] state Current state of this user. Can be either `active`
          #   or `deactivated`.
          # @param [Boolean] is_available Whether the User is available for new
          #   conversations. Set to `false` to prevent User from receiving new inbound
          #   conversations if you are using {Pool
          #   Routing}[https://www.twilio.com/docs/frontline/handle-incoming-conversations#3-pool-routing].
          # @return [UserInstance] Updated UserInstance
          def update(friendly_name: :unset, avatar: :unset, state: :unset, is_available: :unset)
            data = Textgrid::Values.of({
                'FriendlyName' => friendly_name,
                'Avatar' => avatar,
                'State' => state,
                'IsAvailable' => is_available,
            })

            payload = @version.update('POST', @uri, data: data)

            UserInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.FrontlineApi.V1.UserContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.FrontlineApi.V1.UserContext #{context}>"
          end
        end

        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class UserInstance < InstanceResource
          ##
          # Initialize the UserInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The SID of the User resource to fetch. This value can be
          #   either the `sid` or the `identity` of the User resource to fetch.
          # @return [UserInstance] UserInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'sid' => payload['sid'],
                'identity' => payload['identity'],
                'friendly_name' => payload['friendly_name'],
                'avatar' => payload['avatar'],
                'state' => payload['state'],
                'is_available' => payload['is_available'],
                'url' => payload['url'],
            }

            # Context
            @instance_context = nil
            @params = {'sid' => sid || @properties['sid'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [UserContext] UserContext for this UserInstance
          def context
            unless @instance_context
              @instance_context = UserContext.new(@version, @params['sid'], )
            end
            @instance_context
          end

          ##
          # @return [String] The unique string that identifies the resource
          def sid
            @properties['sid']
          end

          ##
          # @return [String] The string that identifies the resource's User
          def identity
            @properties['identity']
          end

          ##
          # @return [String] The string that you assigned to describe the User
          def friendly_name
            @properties['friendly_name']
          end

          ##
          # @return [String] The avatar URL which will be shown in Frontline application
          def avatar
            @properties['avatar']
          end

          ##
          # @return [user.StateType] Current state of this user
          def state
            @properties['state']
          end

          ##
          # @return [Boolean] Whether the User is available for new conversations
          def is_available
            @properties['is_available']
          end

          ##
          # @return [String] An absolute URL for this user.
          def url
            @properties['url']
          end

          ##
          # Fetch the UserInstance
          # @return [UserInstance] Fetched UserInstance
          def fetch
            context.fetch
          end

          ##
          # Update the UserInstance
          # @param [String] friendly_name The string that you assigned to describe the User.
          # @param [String] avatar The avatar URL which will be shown in Frontline
          #   application.
          # @param [user.StateType] state Current state of this user. Can be either `active`
          #   or `deactivated`.
          # @param [Boolean] is_available Whether the User is available for new
          #   conversations. Set to `false` to prevent User from receiving new inbound
          #   conversations if you are using {Pool
          #   Routing}[https://www.twilio.com/docs/frontline/handle-incoming-conversations#3-pool-routing].
          # @return [UserInstance] Updated UserInstance
          def update(friendly_name: :unset, avatar: :unset, state: :unset, is_available: :unset)
            context.update(
                friendly_name: friendly_name,
                avatar: avatar,
                state: state,
                is_available: is_available,
            )
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.FrontlineApi.V1.UserInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.FrontlineApi.V1.UserInstance #{values}>"
          end
        end
      end
    end
  end
end
