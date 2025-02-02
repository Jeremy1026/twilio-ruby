##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Textgrid
  module REST
    class Media < Domain
      class V1 < Version
        class PlayerStreamerContext < InstanceContext
          class PlaybackGrantList < ListResource
            ##
            # Initialize the PlaybackGrantList
            # @param [Version] version Version that contains the resource
            # @param [String] sid The unique string generated to identify the PlayerStreamer
            #   resource that this PlaybackGrant authorizes views for.
            # @return [PlaybackGrantList] PlaybackGrantList
            def initialize(version, sid: nil)
              super(version)

              # Path Solution
              @solution = {sid: sid}
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Media.V1.PlaybackGrantList>'
            end
          end

          class PlaybackGrantPage < Page
            ##
            # Initialize the PlaybackGrantPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [PlaybackGrantPage] PlaybackGrantPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of PlaybackGrantInstance
            # @param [Hash] payload Payload response from the API
            # @return [PlaybackGrantInstance] PlaybackGrantInstance
            def get_instance(payload)
              PlaybackGrantInstance.new(@version, payload, sid: @solution[:sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Media.V1.PlaybackGrantPage>'
            end
          end

          class PlaybackGrantContext < InstanceContext
            ##
            # Initialize the PlaybackGrantContext
            # @param [Version] version Version that contains the resource
            # @param [String] sid The SID of the PlayerStreamer resource to fetch.
            # @return [PlaybackGrantContext] PlaybackGrantContext
            def initialize(version, sid)
              super(version)

              # Path Solution
              @solution = {sid: sid, }
              @uri = "/PlayerStreamers/#{@solution[:sid]}/PlaybackGrant"
            end

            ##
            # Create the PlaybackGrantInstance
            # @param [String] ttl The time to live of the PlaybackGrant. Default value is 15
            #   seconds. Maximum value is 60 seconds.
            # @param [String] access_control_allow_origin The full origin URL where the
            #   livestream can be streamed. If this is not provided, it can be streamed from any
            #   domain.
            # @return [PlaybackGrantInstance] Created PlaybackGrantInstance
            def create(ttl: :unset, access_control_allow_origin: :unset)
              data = Textgrid::Values.of({'Ttl' => ttl, 'AccessControlAllowOrigin' => access_control_allow_origin, })

              payload = @version.create('POST', @uri, data: data)

              PlaybackGrantInstance.new(@version, payload, sid: @solution[:sid], )
            end

            ##
            # Fetch the PlaybackGrantInstance
            # @return [PlaybackGrantInstance] Fetched PlaybackGrantInstance
            def fetch
              payload = @version.fetch('GET', @uri)

              PlaybackGrantInstance.new(@version, payload, sid: @solution[:sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Media.V1.PlaybackGrantContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Media.V1.PlaybackGrantContext #{context}>"
            end
          end

          class PlaybackGrantInstance < InstanceResource
            ##
            # Initialize the PlaybackGrantInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] sid The unique string generated to identify the PlayerStreamer
            #   resource that this PlaybackGrant authorizes views for.
            # @return [PlaybackGrantInstance] PlaybackGrantInstance
            def initialize(version, payload, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'url' => payload['url'],
                  'account_sid' => payload['account_sid'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'grant' => payload['grant'],
              }

              # Context
              @instance_context = nil
              @params = {'sid' => sid, }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [PlaybackGrantContext] PlaybackGrantContext for this PlaybackGrantInstance
            def context
              unless @instance_context
                @instance_context = PlaybackGrantContext.new(@version, @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The unique string that identifies the PlayerStreamer associated with this PlaybackGrant.
            def sid
              @properties['sid']
            end

            ##
            # @return [String] The absolute URL of the resource
            def url
              @properties['url']
            end

            ##
            # @return [String] The SID of the Account that created the resource
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [Time] The ISO 8601 date and time in GMT when the resource was created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Hash] The grant that authorizes the player sdk to connect to the livestream
            def grant
              @properties['grant']
            end

            ##
            # Create the PlaybackGrantInstance
            # @param [String] ttl The time to live of the PlaybackGrant. Default value is 15
            #   seconds. Maximum value is 60 seconds.
            # @param [String] access_control_allow_origin The full origin URL where the
            #   livestream can be streamed. If this is not provided, it can be streamed from any
            #   domain.
            # @return [PlaybackGrantInstance] Created PlaybackGrantInstance
            def create(ttl: :unset, access_control_allow_origin: :unset)
              context.create(ttl: ttl, access_control_allow_origin: access_control_allow_origin, )
            end

            ##
            # Fetch the PlaybackGrantInstance
            # @return [PlaybackGrantInstance] Fetched PlaybackGrantInstance
            def fetch
              context.fetch
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Media.V1.PlaybackGrantInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Media.V1.PlaybackGrantInstance #{values}>"
            end
          end
        end
      end
    end
  end
end
