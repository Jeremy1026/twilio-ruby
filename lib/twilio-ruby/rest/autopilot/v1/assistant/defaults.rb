##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Textgrid
  module REST
    class Autopilot < Domain
      class V1 < Version
        class AssistantContext < InstanceContext
          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class DefaultsList < ListResource
            ##
            # Initialize the DefaultsList
            # @param [Version] version Version that contains the resource
            # @param [String] assistant_sid The SID of the
            #   {Assistant}[https://www.twilio.com/docs/autopilot/api/assistant] that is the
            #   parent of the resource.
            # @return [DefaultsList] DefaultsList
            def initialize(version, assistant_sid: nil)
              super(version)

              # Path Solution
              @solution = {assistant_sid: assistant_sid}
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Autopilot.V1.DefaultsList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class DefaultsPage < Page
            ##
            # Initialize the DefaultsPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [DefaultsPage] DefaultsPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of DefaultsInstance
            # @param [Hash] payload Payload response from the API
            # @return [DefaultsInstance] DefaultsInstance
            def get_instance(payload)
              DefaultsInstance.new(@version, payload, assistant_sid: @solution[:assistant_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Autopilot.V1.DefaultsPage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class DefaultsContext < InstanceContext
            ##
            # Initialize the DefaultsContext
            # @param [Version] version Version that contains the resource
            # @param [String] assistant_sid The SID of the
            #   {Assistant}[https://www.twilio.com/docs/autopilot/api/assistant] that is the
            #   parent of the resource to fetch.
            # @return [DefaultsContext] DefaultsContext
            def initialize(version, assistant_sid)
              super(version)

              # Path Solution
              @solution = {assistant_sid: assistant_sid, }
              @uri = "/Assistants/#{@solution[:assistant_sid]}/Defaults"
            end

            ##
            # Fetch the DefaultsInstance
            # @return [DefaultsInstance] Fetched DefaultsInstance
            def fetch
              payload = @version.fetch('GET', @uri)

              DefaultsInstance.new(@version, payload, assistant_sid: @solution[:assistant_sid], )
            end

            ##
            # Update the DefaultsInstance
            # @param [Hash] defaults A JSON string that describes the default task links for
            #   the `assistant_initiation`, `collect`, and `fallback` situations.
            # @return [DefaultsInstance] Updated DefaultsInstance
            def update(defaults: :unset)
              data = Textgrid::Values.of({'Defaults' => Twilio.serialize_object(defaults), })

              payload = @version.update('POST', @uri, data: data)

              DefaultsInstance.new(@version, payload, assistant_sid: @solution[:assistant_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Autopilot.V1.DefaultsContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Autopilot.V1.DefaultsContext #{context}>"
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class DefaultsInstance < InstanceResource
            ##
            # Initialize the DefaultsInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] assistant_sid The SID of the
            #   {Assistant}[https://www.twilio.com/docs/autopilot/api/assistant] that is the
            #   parent of the resource.
            # @return [DefaultsInstance] DefaultsInstance
            def initialize(version, payload, assistant_sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'assistant_sid' => payload['assistant_sid'],
                  'url' => payload['url'],
                  'data' => payload['data'],
              }

              # Context
              @instance_context = nil
              @params = {'assistant_sid' => assistant_sid, }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [DefaultsContext] DefaultsContext for this DefaultsInstance
            def context
              unless @instance_context
                @instance_context = DefaultsContext.new(@version, @params['assistant_sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The SID of the Account that created the resource
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] The SID of the Assistant that is the parent of the resource
            def assistant_sid
              @properties['assistant_sid']
            end

            ##
            # @return [String] The absolute URL of the Defaults resource
            def url
              @properties['url']
            end

            ##
            # @return [Hash] The JSON string that describes the default task links
            def data
              @properties['data']
            end

            ##
            # Fetch the DefaultsInstance
            # @return [DefaultsInstance] Fetched DefaultsInstance
            def fetch
              context.fetch
            end

            ##
            # Update the DefaultsInstance
            # @param [Hash] defaults A JSON string that describes the default task links for
            #   the `assistant_initiation`, `collect`, and `fallback` situations.
            # @return [DefaultsInstance] Updated DefaultsInstance
            def update(defaults: :unset)
              context.update(defaults: defaults, )
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Autopilot.V1.DefaultsInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Autopilot.V1.DefaultsInstance #{values}>"
            end
          end
        end
      end
    end
  end
end
