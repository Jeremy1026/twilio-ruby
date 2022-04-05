##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Textgrid
  module REST
    class Proxy < Domain
      class V1 < Version
        class ServiceContext < InstanceContext
          class SessionContext < InstanceContext
            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class InteractionList < ListResource
              ##
              # Initialize the InteractionList
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The SID of the parent
              #   {Service}[https://www.twilio.com/docs/proxy/api/service] resource.
              # @param [String] session_sid The SID of the parent
              #   {Session}[https://www.twilio.com/docs/proxy/api/session] resource.
              # @return [InteractionList] InteractionList
              def initialize(version, service_sid: nil, session_sid: nil)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, session_sid: session_sid}
                @uri = "/Services/#{@solution[:service_sid]}/Sessions/#{@solution[:session_sid]}/Interactions"
              end

              ##
              # Lists InteractionInstance records from the API as a list.
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
              # Streams InteractionInstance records from the API as an Enumerable.
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
              # When passed a block, yields InteractionInstance records from the API.
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
              # Retrieve a single page of InteractionInstance records from the API.
              # Request is executed immediately.
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of InteractionInstance
              def page(page_token: :unset, page_number: :unset, page_size: :unset)
                params = Textgrid::Values.of({
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                })

                response = @version.page('GET', @uri, params: params)

                InteractionPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of InteractionInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of InteractionInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                InteractionPage.new(@version, response, @solution)
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Proxy.V1.InteractionList>'
              end
            end

            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class InteractionPage < Page
              ##
              # Initialize the InteractionPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [InteractionPage] InteractionPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of InteractionInstance
              # @param [Hash] payload Payload response from the API
              # @return [InteractionInstance] InteractionInstance
              def get_instance(payload)
                InteractionInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    session_sid: @solution[:session_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Proxy.V1.InteractionPage>'
              end
            end

            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class InteractionContext < InstanceContext
              ##
              # Initialize the InteractionContext
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The SID of the parent
              #   {Service}[https://www.twilio.com/docs/proxy/api/service] of the resource to
              #   fetch.
              # @param [String] session_sid The SID of the parent
              #   {Session}[https://www.twilio.com/docs/proxy/api/session] of the resource to
              #   fetch.
              # @param [String] sid The Twilio-provided string that uniquely identifies the
              #   Interaction resource to fetch.
              # @return [InteractionContext] InteractionContext
              def initialize(version, service_sid, session_sid, sid)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, session_sid: session_sid, sid: sid, }
                @uri = "/Services/#{@solution[:service_sid]}/Sessions/#{@solution[:session_sid]}/Interactions/#{@solution[:sid]}"
              end

              ##
              # Fetch the InteractionInstance
              # @return [InteractionInstance] Fetched InteractionInstance
              def fetch
                payload = @version.fetch('GET', @uri)

                InteractionInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    session_sid: @solution[:session_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Delete the InteractionInstance
              # @return [Boolean] true if delete succeeds, false otherwise
              def delete
                 @version.delete('DELETE', @uri)
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Proxy.V1.InteractionContext #{context}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Proxy.V1.InteractionContext #{context}>"
              end
            end

            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class InteractionInstance < InstanceResource
              ##
              # Initialize the InteractionInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] service_sid The SID of the parent
              #   {Service}[https://www.twilio.com/docs/proxy/api/service] resource.
              # @param [String] session_sid The SID of the parent
              #   {Session}[https://www.twilio.com/docs/proxy/api/session] resource.
              # @param [String] sid The Twilio-provided string that uniquely identifies the
              #   Interaction resource to fetch.
              # @return [InteractionInstance] InteractionInstance
              def initialize(version, payload, service_sid: nil, session_sid: nil, sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'sid' => payload['sid'],
                    'session_sid' => payload['session_sid'],
                    'service_sid' => payload['service_sid'],
                    'account_sid' => payload['account_sid'],
                    'data' => payload['data'],
                    'type' => payload['type'],
                    'inbound_participant_sid' => payload['inbound_participant_sid'],
                    'inbound_resource_sid' => payload['inbound_resource_sid'],
                    'inbound_resource_status' => payload['inbound_resource_status'],
                    'inbound_resource_type' => payload['inbound_resource_type'],
                    'inbound_resource_url' => payload['inbound_resource_url'],
                    'outbound_participant_sid' => payload['outbound_participant_sid'],
                    'outbound_resource_sid' => payload['outbound_resource_sid'],
                    'outbound_resource_status' => payload['outbound_resource_status'],
                    'outbound_resource_type' => payload['outbound_resource_type'],
                    'outbound_resource_url' => payload['outbound_resource_url'],
                    'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                    'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                    'url' => payload['url'],
                }

                # Context
                @instance_context = nil
                @params = {
                    'service_sid' => service_sid,
                    'session_sid' => session_sid,
                    'sid' => sid || @properties['sid'],
                }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [InteractionContext] InteractionContext for this InteractionInstance
              def context
                unless @instance_context
                  @instance_context = InteractionContext.new(
                      @version,
                      @params['service_sid'],
                      @params['session_sid'],
                      @params['sid'],
                  )
                end
                @instance_context
              end

              ##
              # @return [String] The unique string that identifies the resource
              def sid
                @properties['sid']
              end

              ##
              # @return [String] The SID of the resource's parent Session
              def session_sid
                @properties['session_sid']
              end

              ##
              # @return [String] The SID of the resource's parent Service
              def service_sid
                @properties['service_sid']
              end

              ##
              # @return [String] The SID of the Account that created the resource
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] A JSON string that includes the message body of message interactions
              def data
                @properties['data']
              end

              ##
              # @return [interaction.Type] The Type of the Interaction
              def type
                @properties['type']
              end

              ##
              # @return [String] The SID of the inbound Participant resource
              def inbound_participant_sid
                @properties['inbound_participant_sid']
              end

              ##
              # @return [String] The SID of the inbound resource
              def inbound_resource_sid
                @properties['inbound_resource_sid']
              end

              ##
              # @return [interaction.ResourceStatus] The inbound resource status of the Interaction
              def inbound_resource_status
                @properties['inbound_resource_status']
              end

              ##
              # @return [String] The inbound resource type
              def inbound_resource_type
                @properties['inbound_resource_type']
              end

              ##
              # @return [String] The URL of the Twilio inbound resource
              def inbound_resource_url
                @properties['inbound_resource_url']
              end

              ##
              # @return [String] The SID of the outbound Participant
              def outbound_participant_sid
                @properties['outbound_participant_sid']
              end

              ##
              # @return [String] The SID of the outbound resource
              def outbound_resource_sid
                @properties['outbound_resource_sid']
              end

              ##
              # @return [interaction.ResourceStatus] The outbound resource status of the Interaction
              def outbound_resource_status
                @properties['outbound_resource_status']
              end

              ##
              # @return [String] The outbound resource type
              def outbound_resource_type
                @properties['outbound_resource_type']
              end

              ##
              # @return [String] The URL of the Twilio outbound resource
              def outbound_resource_url
                @properties['outbound_resource_url']
              end

              ##
              # @return [Time] The ISO 8601 date and time in GMT when the Interaction was created
              def date_created
                @properties['date_created']
              end

              ##
              # @return [Time] The ISO 8601 date and time in GMT when the resource was last updated
              def date_updated
                @properties['date_updated']
              end

              ##
              # @return [String] The absolute URL of the Interaction resource
              def url
                @properties['url']
              end

              ##
              # Fetch the InteractionInstance
              # @return [InteractionInstance] Fetched InteractionInstance
              def fetch
                context.fetch
              end

              ##
              # Delete the InteractionInstance
              # @return [Boolean] true if delete succeeds, false otherwise
              def delete
                context.delete
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Proxy.V1.InteractionInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Proxy.V1.InteractionInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end
