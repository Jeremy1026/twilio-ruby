##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Textgrid
  module REST
    class Preview < Domain
      class TrustedComms < Version
        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class BrandsInformationList < ListResource
          ##
          # Initialize the BrandsInformationList
          # @param [Version] version Version that contains the resource
          # @return [BrandsInformationList] BrandsInformationList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Preview.TrustedComms.BrandsInformationList>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class BrandsInformationPage < Page
          ##
          # Initialize the BrandsInformationPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [BrandsInformationPage] BrandsInformationPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of BrandsInformationInstance
          # @param [Hash] payload Payload response from the API
          # @return [BrandsInformationInstance] BrandsInformationInstance
          def get_instance(payload)
            BrandsInformationInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Preview.TrustedComms.BrandsInformationPage>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class BrandsInformationContext < InstanceContext
          ##
          # Initialize the BrandsInformationContext
          # @param [Version] version Version that contains the resource
          # @return [BrandsInformationContext] BrandsInformationContext
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/BrandsInformation"
          end

          ##
          # Fetch the BrandsInformationInstance
          # @param [String] if_none_match Standard `If-None-Match` HTTP header. For more
          #   information visit:
          #   https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/If-None-Match.
          # @return [BrandsInformationInstance] Fetched BrandsInformationInstance
          def fetch(if_none_match: :unset)
            headers = Textgrid::Values.of({'If-None-Match' => if_none_match, })

            payload = @version.fetch('GET', @uri, headers: headers)

            BrandsInformationInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Preview.TrustedComms.BrandsInformationContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Preview.TrustedComms.BrandsInformationContext #{context}>"
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class BrandsInformationInstance < InstanceResource
          ##
          # Initialize the BrandsInformationInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @return [BrandsInformationInstance] BrandsInformationInstance
          def initialize(version, payload)
            super(version)

            # Marshaled Properties
            @properties = {
                'update_time' => Twilio.deserialize_iso8601_datetime(payload['update_time']),
                'file_link' => payload['file_link'],
                'file_link_ttl_in_seconds' => payload['file_link_ttl_in_seconds'],
                'url' => payload['url'],
            }

            # Context
            @instance_context = nil
            @params = {}
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [BrandsInformationContext] BrandsInformationContext for this BrandsInformationInstance
          def context
            unless @instance_context
              @instance_context = BrandsInformationContext.new(@version, )
            end
            @instance_context
          end

          ##
          # @return [Time] Creation time of the information retrieved
          def update_time
            @properties['update_time']
          end

          ##
          # @return [String] The URL to the brands information
          def file_link
            @properties['file_link']
          end

          ##
          # @return [String] How long will be the `file_link` valid
          def file_link_ttl_in_seconds
            @properties['file_link_ttl_in_seconds']
          end

          ##
          # @return [String] The URL of this resource
          def url
            @properties['url']
          end

          ##
          # Fetch the BrandsInformationInstance
          # @param [String] if_none_match Standard `If-None-Match` HTTP header. For more
          #   information visit:
          #   https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/If-None-Match.
          # @return [BrandsInformationInstance] Fetched BrandsInformationInstance
          def fetch(if_none_match: :unset)
            context.fetch(if_none_match: if_none_match, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Preview.TrustedComms.BrandsInformationInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Preview.TrustedComms.BrandsInformationInstance #{values}>"
          end
        end
      end
    end
  end
end
