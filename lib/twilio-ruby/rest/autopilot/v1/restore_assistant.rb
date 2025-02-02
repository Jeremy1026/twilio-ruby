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
        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class RestoreAssistantList < ListResource
          ##
          # Initialize the RestoreAssistantList
          # @param [Version] version Version that contains the resource
          # @return [RestoreAssistantList] RestoreAssistantList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Assistants/Restore"
          end

          ##
          # Update the RestoreAssistantInstance
          # @param [String] assistant The Twilio-provided string that uniquely identifies
          #   the Assistant resource to restore.
          # @return [RestoreAssistantInstance] Updated RestoreAssistantInstance
          def update(assistant: nil)
            data = Textgrid::Values.of({'Assistant' => assistant, })

            payload = @version.update('POST', @uri, data: data)

            RestoreAssistantInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Autopilot.V1.RestoreAssistantList>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class RestoreAssistantPage < Page
          ##
          # Initialize the RestoreAssistantPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [RestoreAssistantPage] RestoreAssistantPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of RestoreAssistantInstance
          # @param [Hash] payload Payload response from the API
          # @return [RestoreAssistantInstance] RestoreAssistantInstance
          def get_instance(payload)
            RestoreAssistantInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Autopilot.V1.RestoreAssistantPage>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class RestoreAssistantInstance < InstanceResource
          ##
          # Initialize the RestoreAssistantInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @return [RestoreAssistantInstance] RestoreAssistantInstance
          def initialize(version, payload)
            super(version)

            # Marshaled Properties
            @properties = {
                'account_sid' => payload['account_sid'],
                'sid' => payload['sid'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                'unique_name' => payload['unique_name'],
                'friendly_name' => payload['friendly_name'],
                'needs_model_build' => payload['needs_model_build'],
                'latest_model_build_sid' => payload['latest_model_build_sid'],
                'log_queries' => payload['log_queries'],
                'development_stage' => payload['development_stage'],
                'callback_url' => payload['callback_url'],
                'callback_events' => payload['callback_events'],
            }
          end

          ##
          # @return [String] The SID of the Account that created the resource
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [String] The unique string that identifies the resource
          def sid
            @properties['sid']
          end

          ##
          # @return [Time] The RFC 2822 date and time in GMT when the resource was created
          def date_created
            @properties['date_created']
          end

          ##
          # @return [Time] The RFC 2822 date and time in GMT when the resource was last updated
          def date_updated
            @properties['date_updated']
          end

          ##
          # @return [String] An application-defined string that uniquely identifies the resource
          def unique_name
            @properties['unique_name']
          end

          ##
          # @return [String] The string that you assigned to describe the resource
          def friendly_name
            @properties['friendly_name']
          end

          ##
          # @return [Boolean] Whether model needs to be rebuilt
          def needs_model_build
            @properties['needs_model_build']
          end

          ##
          # @return [String] Reserved
          def latest_model_build_sid
            @properties['latest_model_build_sid']
          end

          ##
          # @return [Boolean] Whether queries should be logged and kept after training
          def log_queries
            @properties['log_queries']
          end

          ##
          # @return [String] A string describing the state of the assistant.
          def development_stage
            @properties['development_stage']
          end

          ##
          # @return [String] Reserved
          def callback_url
            @properties['callback_url']
          end

          ##
          # @return [String] Reserved
          def callback_events
            @properties['callback_events']
          end

          ##
          # Provide a user friendly representation
          def to_s
            "<Twilio.Autopilot.V1.RestoreAssistantInstance>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            "<Twilio.Autopilot.V1.RestoreAssistantInstance>"
          end
        end
      end
    end
  end
end
