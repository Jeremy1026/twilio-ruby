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
      class Wireless < Version
        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class RatePlanList < ListResource
          ##
          # Initialize the RatePlanList
          # @param [Version] version Version that contains the resource
          # @return [RatePlanList] RatePlanList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/RatePlans"
          end

          ##
          # Lists RatePlanInstance records from the API as a list.
          # Unlike stream(), this operation is eager and will load `limit` records into
          # memory before returning.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit.  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records.  If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Array] Array of up to limit results
          def list(limit: nil, page_size: nil)
            self.stream(limit: limit, page_size: page_size).entries
          end

          ##
          # Streams RatePlanInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit. Default is no limit.
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records. If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Enumerable] Enumerable that will yield up to limit results
          def stream(limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)

            page = self.page(page_size: limits[:page_size], )

            @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
          end

          ##
          # When passed a block, yields RatePlanInstance records from the API.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          def each
            limits = @version.read_limits

            page = self.page(page_size: limits[:page_size], )

            @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
          end

          ##
          # Retrieve a single page of RatePlanInstance records from the API.
          # Request is executed immediately.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of RatePlanInstance
          def page(page_token: :unset, page_number: :unset, page_size: :unset)
            params = Textgrid::Values.of({
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            })

            response = @version.page('GET', @uri, params: params)

            RatePlanPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of RatePlanInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of RatePlanInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            RatePlanPage.new(@version, response, @solution)
          end

          ##
          # Create the RatePlanInstance
          # @param [String] unique_name The unique_name
          # @param [String] friendly_name The friendly_name
          # @param [Boolean] data_enabled The data_enabled
          # @param [String] data_limit The data_limit
          # @param [String] data_metering The data_metering
          # @param [Boolean] messaging_enabled The messaging_enabled
          # @param [Boolean] voice_enabled The voice_enabled
          # @param [Boolean] commands_enabled The commands_enabled
          # @param [Boolean] national_roaming_enabled The national_roaming_enabled
          # @param [Array[String]] international_roaming The international_roaming
          # @return [RatePlanInstance] Created RatePlanInstance
          def create(unique_name: :unset, friendly_name: :unset, data_enabled: :unset, data_limit: :unset, data_metering: :unset, messaging_enabled: :unset, voice_enabled: :unset, commands_enabled: :unset, national_roaming_enabled: :unset, international_roaming: :unset)
            data = Textgrid::Values.of({
                'UniqueName' => unique_name,
                'FriendlyName' => friendly_name,
                'DataEnabled' => data_enabled,
                'DataLimit' => data_limit,
                'DataMetering' => data_metering,
                'MessagingEnabled' => messaging_enabled,
                'VoiceEnabled' => voice_enabled,
                'CommandsEnabled' => commands_enabled,
                'NationalRoamingEnabled' => national_roaming_enabled,
                'InternationalRoaming' => Twilio.serialize_list(international_roaming) { |e| e },
            })

            payload = @version.create('POST', @uri, data: data)

            RatePlanInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Preview.Wireless.RatePlanList>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class RatePlanPage < Page
          ##
          # Initialize the RatePlanPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [RatePlanPage] RatePlanPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of RatePlanInstance
          # @param [Hash] payload Payload response from the API
          # @return [RatePlanInstance] RatePlanInstance
          def get_instance(payload)
            RatePlanInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Preview.Wireless.RatePlanPage>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class RatePlanContext < InstanceContext
          ##
          # Initialize the RatePlanContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The sid
          # @return [RatePlanContext] RatePlanContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {sid: sid, }
            @uri = "/RatePlans/#{@solution[:sid]}"
          end

          ##
          # Fetch the RatePlanInstance
          # @return [RatePlanInstance] Fetched RatePlanInstance
          def fetch
            payload = @version.fetch('GET', @uri)

            RatePlanInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Update the RatePlanInstance
          # @param [String] unique_name The unique_name
          # @param [String] friendly_name The friendly_name
          # @return [RatePlanInstance] Updated RatePlanInstance
          def update(unique_name: :unset, friendly_name: :unset)
            data = Textgrid::Values.of({'UniqueName' => unique_name, 'FriendlyName' => friendly_name, })

            payload = @version.update('POST', @uri, data: data)

            RatePlanInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Delete the RatePlanInstance
          # @return [Boolean] true if delete succeeds, false otherwise
          def delete
             @version.delete('DELETE', @uri)
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Preview.Wireless.RatePlanContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Preview.Wireless.RatePlanContext #{context}>"
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class RatePlanInstance < InstanceResource
          ##
          # Initialize the RatePlanInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The sid
          # @return [RatePlanInstance] RatePlanInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'sid' => payload['sid'],
                'unique_name' => payload['unique_name'],
                'account_sid' => payload['account_sid'],
                'friendly_name' => payload['friendly_name'],
                'data_enabled' => payload['data_enabled'],
                'data_metering' => payload['data_metering'],
                'data_limit' => payload['data_limit'].to_i,
                'messaging_enabled' => payload['messaging_enabled'],
                'voice_enabled' => payload['voice_enabled'],
                'national_roaming_enabled' => payload['national_roaming_enabled'],
                'international_roaming' => payload['international_roaming'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                'url' => payload['url'],
            }

            # Context
            @instance_context = nil
            @params = {'sid' => sid || @properties['sid'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [RatePlanContext] RatePlanContext for this RatePlanInstance
          def context
            unless @instance_context
              @instance_context = RatePlanContext.new(@version, @params['sid'], )
            end
            @instance_context
          end

          ##
          # @return [String] The sid
          def sid
            @properties['sid']
          end

          ##
          # @return [String] The unique_name
          def unique_name
            @properties['unique_name']
          end

          ##
          # @return [String] The account_sid
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [String] The friendly_name
          def friendly_name
            @properties['friendly_name']
          end

          ##
          # @return [Boolean] The data_enabled
          def data_enabled
            @properties['data_enabled']
          end

          ##
          # @return [String] The data_metering
          def data_metering
            @properties['data_metering']
          end

          ##
          # @return [String] The data_limit
          def data_limit
            @properties['data_limit']
          end

          ##
          # @return [Boolean] The messaging_enabled
          def messaging_enabled
            @properties['messaging_enabled']
          end

          ##
          # @return [Boolean] The voice_enabled
          def voice_enabled
            @properties['voice_enabled']
          end

          ##
          # @return [Boolean] The national_roaming_enabled
          def national_roaming_enabled
            @properties['national_roaming_enabled']
          end

          ##
          # @return [Array[String]] The international_roaming
          def international_roaming
            @properties['international_roaming']
          end

          ##
          # @return [Time] The date_created
          def date_created
            @properties['date_created']
          end

          ##
          # @return [Time] The date_updated
          def date_updated
            @properties['date_updated']
          end

          ##
          # @return [String] The url
          def url
            @properties['url']
          end

          ##
          # Fetch the RatePlanInstance
          # @return [RatePlanInstance] Fetched RatePlanInstance
          def fetch
            context.fetch
          end

          ##
          # Update the RatePlanInstance
          # @param [String] unique_name The unique_name
          # @param [String] friendly_name The friendly_name
          # @return [RatePlanInstance] Updated RatePlanInstance
          def update(unique_name: :unset, friendly_name: :unset)
            context.update(unique_name: unique_name, friendly_name: friendly_name, )
          end

          ##
          # Delete the RatePlanInstance
          # @return [Boolean] true if delete succeeds, false otherwise
          def delete
            context.delete
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Preview.Wireless.RatePlanInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Preview.Wireless.RatePlanInstance #{values}>"
          end
        end
      end
    end
  end
end
