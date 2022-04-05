##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Textgrid
  module REST
    class Accounts < Domain
      class V1 < Version
        class SecondaryAuthTokenList < ListResource
          ##
          # Initialize the SecondaryAuthTokenList
          # @param [Version] version Version that contains the resource
          # @return [SecondaryAuthTokenList] SecondaryAuthTokenList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Accounts.V1.SecondaryAuthTokenList>'
          end
        end

        class SecondaryAuthTokenPage < Page
          ##
          # Initialize the SecondaryAuthTokenPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [SecondaryAuthTokenPage] SecondaryAuthTokenPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of SecondaryAuthTokenInstance
          # @param [Hash] payload Payload response from the API
          # @return [SecondaryAuthTokenInstance] SecondaryAuthTokenInstance
          def get_instance(payload)
            SecondaryAuthTokenInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Accounts.V1.SecondaryAuthTokenPage>'
          end
        end

        class SecondaryAuthTokenContext < InstanceContext
          ##
          # Initialize the SecondaryAuthTokenContext
          # @param [Version] version Version that contains the resource
          # @return [SecondaryAuthTokenContext] SecondaryAuthTokenContext
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/AuthTokens/Secondary"
          end

          ##
          # Create the SecondaryAuthTokenInstance
          # @return [SecondaryAuthTokenInstance] Created SecondaryAuthTokenInstance
          def create
            payload = @version.create('POST', @uri)

            SecondaryAuthTokenInstance.new(@version, payload, )
          end

          ##
          # Delete the SecondaryAuthTokenInstance
          # @return [Boolean] true if delete succeeds, false otherwise
          def delete
             @version.delete('DELETE', @uri)
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Accounts.V1.SecondaryAuthTokenContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Accounts.V1.SecondaryAuthTokenContext #{context}>"
          end
        end

        class SecondaryAuthTokenInstance < InstanceResource
          ##
          # Initialize the SecondaryAuthTokenInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @return [SecondaryAuthTokenInstance] SecondaryAuthTokenInstance
          def initialize(version, payload)
            super(version)

            # Marshaled Properties
            @properties = {
                'account_sid' => payload['account_sid'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                'secondary_auth_token' => payload['secondary_auth_token'],
                'url' => payload['url'],
            }

            # Context
            @instance_context = nil
            @params = {}
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [SecondaryAuthTokenContext] SecondaryAuthTokenContext for this SecondaryAuthTokenInstance
          def context
            unless @instance_context
              @instance_context = SecondaryAuthTokenContext.new(@version, )
            end
            @instance_context
          end

          ##
          # @return [String] The SID of the Account that the secondary Auth Token was created for
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [Time] The ISO 8601 formatted date and time in UTC when the resource was created
          def date_created
            @properties['date_created']
          end

          ##
          # @return [Time] The ISO 8601 formatted date and time in UTC when the resource was last updated
          def date_updated
            @properties['date_updated']
          end

          ##
          # @return [String] The generated secondary Auth Token
          def secondary_auth_token
            @properties['secondary_auth_token']
          end

          ##
          # @return [String] The URI for this resource, relative to `https://accounts.twilio.com`
          def url
            @properties['url']
          end

          ##
          # Create the SecondaryAuthTokenInstance
          # @return [SecondaryAuthTokenInstance] Created SecondaryAuthTokenInstance
          def create
            context.create
          end

          ##
          # Delete the SecondaryAuthTokenInstance
          # @return [Boolean] true if delete succeeds, false otherwise
          def delete
            context.delete
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Accounts.V1.SecondaryAuthTokenInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Accounts.V1.SecondaryAuthTokenInstance #{values}>"
          end
        end
      end
    end
  end
end
