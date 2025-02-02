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
          class WebhookList < ListResource
            ##
            # Initialize the WebhookList
            # @param [Version] version Version that contains the resource
            # @param [String] assistant_sid The SID of the
            #   {Assistant}[https://www.twilio.com/docs/autopilot/api/assistant] that is the
            #   parent of the resource.
            # @return [WebhookList] WebhookList
            def initialize(version, assistant_sid: nil)
              super(version)

              # Path Solution
              @solution = {assistant_sid: assistant_sid}
              @uri = "/Assistants/#{@solution[:assistant_sid]}/Webhooks"
            end

            ##
            # Lists WebhookInstance records from the API as a list.
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
            # Streams WebhookInstance records from the API as an Enumerable.
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
            # When passed a block, yields WebhookInstance records from the API.
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
            # Retrieve a single page of WebhookInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of WebhookInstance
            def page(page_token: :unset, page_number: :unset, page_size: :unset)
              params = Textgrid::Values.of({
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })

              response = @version.page('GET', @uri, params: params)

              WebhookPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of WebhookInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of WebhookInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              WebhookPage.new(@version, response, @solution)
            end

            ##
            # Create the WebhookInstance
            # @param [String] unique_name An application-defined string that uniquely
            #   identifies the new resource. It can be used as an alternative to the `sid` in
            #   the URL path to address the resource. This value must be unique and 64
            #   characters or less in length.
            # @param [String] events The list of space-separated events that this Webhook will
            #   subscribe to.
            # @param [String] webhook_url The URL associated with this Webhook.
            # @param [String] webhook_method The method to be used when calling the webhook's
            #   URL.
            # @return [WebhookInstance] Created WebhookInstance
            def create(unique_name: nil, events: nil, webhook_url: nil, webhook_method: :unset)
              data = Textgrid::Values.of({
                  'UniqueName' => unique_name,
                  'Events' => events,
                  'WebhookUrl' => webhook_url,
                  'WebhookMethod' => webhook_method,
              })

              payload = @version.create('POST', @uri, data: data)

              WebhookInstance.new(@version, payload, assistant_sid: @solution[:assistant_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Autopilot.V1.WebhookList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class WebhookPage < Page
            ##
            # Initialize the WebhookPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [WebhookPage] WebhookPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of WebhookInstance
            # @param [Hash] payload Payload response from the API
            # @return [WebhookInstance] WebhookInstance
            def get_instance(payload)
              WebhookInstance.new(@version, payload, assistant_sid: @solution[:assistant_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Autopilot.V1.WebhookPage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class WebhookContext < InstanceContext
            ##
            # Initialize the WebhookContext
            # @param [Version] version Version that contains the resource
            # @param [String] assistant_sid The SID of the
            #   {Assistant}[https://www.twilio.com/docs/autopilot/api/assistant] that is the
            #   parent of the resource to fetch.
            # @param [String] sid The Twilio-provided string that uniquely identifies the
            #   Webhook resource to fetch.
            # @return [WebhookContext] WebhookContext
            def initialize(version, assistant_sid, sid)
              super(version)

              # Path Solution
              @solution = {assistant_sid: assistant_sid, sid: sid, }
              @uri = "/Assistants/#{@solution[:assistant_sid]}/Webhooks/#{@solution[:sid]}"
            end

            ##
            # Fetch the WebhookInstance
            # @return [WebhookInstance] Fetched WebhookInstance
            def fetch
              payload = @version.fetch('GET', @uri)

              WebhookInstance.new(
                  @version,
                  payload,
                  assistant_sid: @solution[:assistant_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Update the WebhookInstance
            # @param [String] unique_name An application-defined string that uniquely
            #   identifies the new resource. It can be used as an alternative to the `sid` in
            #   the URL path to address the resource. This value must be unique and 64
            #   characters or less in length.
            # @param [String] events The list of space-separated events that this Webhook will
            #   subscribe to.
            # @param [String] webhook_url The URL associated with this Webhook.
            # @param [String] webhook_method The method to be used when calling the webhook's
            #   URL.
            # @return [WebhookInstance] Updated WebhookInstance
            def update(unique_name: :unset, events: :unset, webhook_url: :unset, webhook_method: :unset)
              data = Textgrid::Values.of({
                  'UniqueName' => unique_name,
                  'Events' => events,
                  'WebhookUrl' => webhook_url,
                  'WebhookMethod' => webhook_method,
              })

              payload = @version.update('POST', @uri, data: data)

              WebhookInstance.new(
                  @version,
                  payload,
                  assistant_sid: @solution[:assistant_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Delete the WebhookInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
               @version.delete('DELETE', @uri)
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Autopilot.V1.WebhookContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Autopilot.V1.WebhookContext #{context}>"
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class WebhookInstance < InstanceResource
            ##
            # Initialize the WebhookInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] assistant_sid The SID of the
            #   {Assistant}[https://www.twilio.com/docs/autopilot/api/assistant] that is the
            #   parent of the resource.
            # @param [String] sid The Twilio-provided string that uniquely identifies the
            #   Webhook resource to fetch.
            # @return [WebhookInstance] WebhookInstance
            def initialize(version, payload, assistant_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'url' => payload['url'],
                  'account_sid' => payload['account_sid'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'assistant_sid' => payload['assistant_sid'],
                  'sid' => payload['sid'],
                  'unique_name' => payload['unique_name'],
                  'events' => payload['events'],
                  'webhook_url' => payload['webhook_url'],
                  'webhook_method' => payload['webhook_method'],
              }

              # Context
              @instance_context = nil
              @params = {'assistant_sid' => assistant_sid, 'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [WebhookContext] WebhookContext for this WebhookInstance
            def context
              unless @instance_context
                @instance_context = WebhookContext.new(@version, @params['assistant_sid'], @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The absolute URL of the Webhook resource
            def url
              @properties['url']
            end

            ##
            # @return [String] The SID of the Account that created the resource
            def account_sid
              @properties['account_sid']
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
            # @return [String] The SID of the Assistant that is the parent of the resource
            def assistant_sid
              @properties['assistant_sid']
            end

            ##
            # @return [String] The unique string that identifies the resource
            def sid
              @properties['sid']
            end

            ##
            # @return [String] An application-defined string that uniquely identifies the resource
            def unique_name
              @properties['unique_name']
            end

            ##
            # @return [String] The list of space-separated events that this Webhook is subscribed to.
            def events
              @properties['events']
            end

            ##
            # @return [String] The URL associated with this Webhook.
            def webhook_url
              @properties['webhook_url']
            end

            ##
            # @return [String] The method used when calling the webhook's URL.
            def webhook_method
              @properties['webhook_method']
            end

            ##
            # Fetch the WebhookInstance
            # @return [WebhookInstance] Fetched WebhookInstance
            def fetch
              context.fetch
            end

            ##
            # Update the WebhookInstance
            # @param [String] unique_name An application-defined string that uniquely
            #   identifies the new resource. It can be used as an alternative to the `sid` in
            #   the URL path to address the resource. This value must be unique and 64
            #   characters or less in length.
            # @param [String] events The list of space-separated events that this Webhook will
            #   subscribe to.
            # @param [String] webhook_url The URL associated with this Webhook.
            # @param [String] webhook_method The method to be used when calling the webhook's
            #   URL.
            # @return [WebhookInstance] Updated WebhookInstance
            def update(unique_name: :unset, events: :unset, webhook_url: :unset, webhook_method: :unset)
              context.update(
                  unique_name: unique_name,
                  events: events,
                  webhook_url: webhook_url,
                  webhook_method: webhook_method,
              )
            end

            ##
            # Delete the WebhookInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
              context.delete
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Autopilot.V1.WebhookInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Autopilot.V1.WebhookInstance #{values}>"
            end
          end
        end
      end
    end
  end
end
