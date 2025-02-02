##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Textgrid
  module REST
    class FlexApi < Domain
      class V1 < Version
        class FlexFlowList < ListResource
          ##
          # Initialize the FlexFlowList
          # @param [Version] version Version that contains the resource
          # @return [FlexFlowList] FlexFlowList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/FlexFlows"
          end

          ##
          # Lists FlexFlowInstance records from the API as a list.
          # Unlike stream(), this operation is eager and will load `limit` records into
          # memory before returning.
          # @param [String] friendly_name The `friendly_name` of the Flex Flow resources to
          #   read.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit.  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records.  If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Array] Array of up to limit results
          def list(friendly_name: :unset, limit: nil, page_size: nil)
            self.stream(friendly_name: friendly_name, limit: limit, page_size: page_size).entries
          end

          ##
          # Streams FlexFlowInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [String] friendly_name The `friendly_name` of the Flex Flow resources to
          #   read.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit. Default is no limit.
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records. If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Enumerable] Enumerable that will yield up to limit results
          def stream(friendly_name: :unset, limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)

            page = self.page(friendly_name: friendly_name, page_size: limits[:page_size], )

            @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
          end

          ##
          # When passed a block, yields FlexFlowInstance records from the API.
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
          # Retrieve a single page of FlexFlowInstance records from the API.
          # Request is executed immediately.
          # @param [String] friendly_name The `friendly_name` of the Flex Flow resources to
          #   read.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of FlexFlowInstance
          def page(friendly_name: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
            params = Textgrid::Values.of({
                'FriendlyName' => friendly_name,
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            })

            response = @version.page('GET', @uri, params: params)

            FlexFlowPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of FlexFlowInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of FlexFlowInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            FlexFlowPage.new(@version, response, @solution)
          end

          ##
          # Create the FlexFlowInstance
          # @param [String] friendly_name A descriptive string that you create to describe
          #   the Flex Flow resource.
          # @param [String] chat_service_sid The SID of the chat service.
          # @param [flex_flow.ChannelType] channel_type The channel type. One of `web`,
          #   `facebook`, `sms`, `whatsapp`, `line` or `custom`. By default, Studio’s Send to
          #   Flex widget passes it on to the Task attributes for Tasks created based on this
          #   Flex Flow. The Task attributes will be used by the Flex UI to render the
          #   respective Task as appropriate (applying channel-specific design and length
          #   limits). If `channelType` is `facebook`, `whatsapp` or `line`, the Send to Flex
          #   widget should set the Task Channel to Programmable Chat.
          # @param [String] contact_identity The channel contact's Identity.
          # @param [Boolean] enabled Whether the new Flex Flow is enabled.
          # @param [flex_flow.IntegrationType] integration_type The software that will
          #   handle inbound messages. {Integration
          #   Type}[https://www.twilio.com/docs/flex/developer/messaging/manage-flows#integration-types]
          #   can be: `studio`, `external`, or `task`.
          # @param [String] integration_flow_sid The SID of the Studio Flow. Required when
          #   `integrationType` is `studio`.
          # @param [String] integration_url The URL of the external webhook. Required when
          #   `integrationType` is `external`.
          # @param [String] integration_workspace_sid The Workspace SID for a new Task.
          #   Required when `integrationType` is `task`.
          # @param [String] integration_workflow_sid The Workflow SID for a new Task.
          #   Required when `integrationType` is `task`.
          # @param [String] integration_channel The Task Channel SID (TCXXXX) or unique name
          #   (e.g., `sms`) to use for the Task that will be created. Applicable and required
          #   when `integrationType` is `task`. The default value is `default`.
          # @param [String] integration_timeout The Task timeout in seconds for a new Task.
          #   Default is 86,400 seconds (24 hours). Optional when `integrationType` is `task`,
          #   not applicable otherwise.
          # @param [String] integration_priority The Task priority of a new Task. The
          #   default priority is 0. Optional when `integrationType` is `task`, not applicable
          #   otherwise.
          # @param [Boolean] integration_creation_on_message In the context of outbound
          #   messaging, defines whether to create a Task immediately (and therefore reserve
          #   the conversation to current agent), or delay Task creation until the customer
          #   sends the first response. Set to false to create immediately, true to delay Task
          #   creation. This setting is only applicable for outbound messaging.
          # @param [Boolean] long_lived When enabled, Flex will keep the chat channel active
          #   so that it may be used for subsequent interactions with a contact identity.
          #   Defaults to `false`.
          # @param [Boolean] janitor_enabled When enabled, the Messaging Channel Janitor
          #   will remove active Proxy sessions if the associated Task is deleted outside of
          #   the Flex UI. Defaults to `false`.
          # @param [String] integration_retry_count The number of times to retry the Studio
          #   Flow or webhook in case of failure. Takes integer values from 0 to 3 with the
          #   default being 3. Optional when `integrationType` is `studio` or `external`, not
          #   applicable otherwise.
          # @return [FlexFlowInstance] Created FlexFlowInstance
          def create(friendly_name: nil, chat_service_sid: nil, channel_type: nil, contact_identity: :unset, enabled: :unset, integration_type: :unset, integration_flow_sid: :unset, integration_url: :unset, integration_workspace_sid: :unset, integration_workflow_sid: :unset, integration_channel: :unset, integration_timeout: :unset, integration_priority: :unset, integration_creation_on_message: :unset, long_lived: :unset, janitor_enabled: :unset, integration_retry_count: :unset)
            data = Textgrid::Values.of({
                'FriendlyName' => friendly_name,
                'ChatServiceSid' => chat_service_sid,
                'ChannelType' => channel_type,
                'ContactIdentity' => contact_identity,
                'Enabled' => enabled,
                'IntegrationType' => integration_type,
                'Integration.FlowSid' => integration_flow_sid,
                'Integration.Url' => integration_url,
                'Integration.WorkspaceSid' => integration_workspace_sid,
                'Integration.WorkflowSid' => integration_workflow_sid,
                'Integration.Channel' => integration_channel,
                'Integration.Timeout' => integration_timeout,
                'Integration.Priority' => integration_priority,
                'Integration.CreationOnMessage' => integration_creation_on_message,
                'LongLived' => long_lived,
                'JanitorEnabled' => janitor_enabled,
                'Integration.RetryCount' => integration_retry_count,
            })

            payload = @version.create('POST', @uri, data: data)

            FlexFlowInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.FlexApi.V1.FlexFlowList>'
          end
        end

        class FlexFlowPage < Page
          ##
          # Initialize the FlexFlowPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [FlexFlowPage] FlexFlowPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of FlexFlowInstance
          # @param [Hash] payload Payload response from the API
          # @return [FlexFlowInstance] FlexFlowInstance
          def get_instance(payload)
            FlexFlowInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.FlexApi.V1.FlexFlowPage>'
          end
        end

        class FlexFlowContext < InstanceContext
          ##
          # Initialize the FlexFlowContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The SID of the Flex Flow resource to fetch.
          # @return [FlexFlowContext] FlexFlowContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {sid: sid, }
            @uri = "/FlexFlows/#{@solution[:sid]}"
          end

          ##
          # Fetch the FlexFlowInstance
          # @return [FlexFlowInstance] Fetched FlexFlowInstance
          def fetch
            payload = @version.fetch('GET', @uri)

            FlexFlowInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Update the FlexFlowInstance
          # @param [String] friendly_name A descriptive string that you create to describe
          #   the Flex Flow resource.
          # @param [String] chat_service_sid The SID of the chat service.
          # @param [flex_flow.ChannelType] channel_type The channel type. One of `web`,
          #   `facebook`, `sms`, `whatsapp`, `line` or `custom`. By default, Studio’s Send to
          #   Flex widget passes it on to the Task attributes for Tasks created based on this
          #   Flex Flow. The Task attributes will be used by the Flex UI to render the
          #   respective Task as appropriate (applying channel-specific design and length
          #   limits). If `channelType` is `facebook`, `whatsapp` or `line`, the Send to Flex
          #   widget should set the Task Channel to Programmable Chat.
          # @param [String] contact_identity The channel contact's Identity.
          # @param [Boolean] enabled Whether the new Flex Flow is enabled.
          # @param [flex_flow.IntegrationType] integration_type The software that will
          #   handle inbound messages. {Integration
          #   Type}[https://www.twilio.com/docs/flex/developer/messaging/manage-flows#integration-types]
          #   can be: `studio`, `external`, or `task`.
          # @param [String] integration_flow_sid The SID of the Studio Flow. Required when
          #   `integrationType` is `studio`.
          # @param [String] integration_url The URL of the external webhook. Required when
          #   `integrationType` is `external`.
          # @param [String] integration_workspace_sid The Workspace SID for a new Task.
          #   Required when `integrationType` is `task`.
          # @param [String] integration_workflow_sid The Workflow SID for a new Task.
          #   Required when `integrationType` is `task`.
          # @param [String] integration_channel The Task Channel SID (TCXXXX) or unique name
          #   (e.g., `sms`) to use for the Task that will be created. Applicable and required
          #   when `integrationType` is `task`. The default value is `default`.
          # @param [String] integration_timeout The Task timeout in seconds for a new Task.
          #   Default is 86,400 seconds (24 hours). Optional when `integrationType` is `task`,
          #   not applicable otherwise.
          # @param [String] integration_priority The Task priority of a new Task. The
          #   default priority is 0. Optional when `integrationType` is `task`, not applicable
          #   otherwise.
          # @param [Boolean] integration_creation_on_message In the context of outbound
          #   messaging, defines whether to create a Task immediately (and therefore reserve
          #   the conversation to current agent), or delay Task creation until the customer
          #   sends the first response. Set to false to create immediately, true to delay Task
          #   creation. This setting is only applicable for outbound messaging.
          # @param [Boolean] long_lived When enabled, Flex will keep the chat channel active
          #   so that it may be used for subsequent interactions with a contact identity.
          #   Defaults to `false`.
          # @param [Boolean] janitor_enabled When enabled, the Messaging Channel Janitor
          #   will remove active Proxy sessions if the associated Task is deleted outside of
          #   the Flex UI. Defaults to `false`.
          # @param [String] integration_retry_count The number of times to retry the Studio
          #   Flow or webhook in case of failure. Takes integer values from 0 to 3 with the
          #   default being 3. Optional when `integrationType` is `studio` or `external`, not
          #   applicable otherwise.
          # @return [FlexFlowInstance] Updated FlexFlowInstance
          def update(friendly_name: :unset, chat_service_sid: :unset, channel_type: :unset, contact_identity: :unset, enabled: :unset, integration_type: :unset, integration_flow_sid: :unset, integration_url: :unset, integration_workspace_sid: :unset, integration_workflow_sid: :unset, integration_channel: :unset, integration_timeout: :unset, integration_priority: :unset, integration_creation_on_message: :unset, long_lived: :unset, janitor_enabled: :unset, integration_retry_count: :unset)
            data = Textgrid::Values.of({
                'FriendlyName' => friendly_name,
                'ChatServiceSid' => chat_service_sid,
                'ChannelType' => channel_type,
                'ContactIdentity' => contact_identity,
                'Enabled' => enabled,
                'IntegrationType' => integration_type,
                'Integration.FlowSid' => integration_flow_sid,
                'Integration.Url' => integration_url,
                'Integration.WorkspaceSid' => integration_workspace_sid,
                'Integration.WorkflowSid' => integration_workflow_sid,
                'Integration.Channel' => integration_channel,
                'Integration.Timeout' => integration_timeout,
                'Integration.Priority' => integration_priority,
                'Integration.CreationOnMessage' => integration_creation_on_message,
                'LongLived' => long_lived,
                'JanitorEnabled' => janitor_enabled,
                'Integration.RetryCount' => integration_retry_count,
            })

            payload = @version.update('POST', @uri, data: data)

            FlexFlowInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Delete the FlexFlowInstance
          # @return [Boolean] true if delete succeeds, false otherwise
          def delete
             @version.delete('DELETE', @uri)
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.FlexApi.V1.FlexFlowContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.FlexApi.V1.FlexFlowContext #{context}>"
          end
        end

        class FlexFlowInstance < InstanceResource
          ##
          # Initialize the FlexFlowInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The SID of the Flex Flow resource to fetch.
          # @return [FlexFlowInstance] FlexFlowInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'account_sid' => payload['account_sid'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                'sid' => payload['sid'],
                'friendly_name' => payload['friendly_name'],
                'chat_service_sid' => payload['chat_service_sid'],
                'channel_type' => payload['channel_type'],
                'contact_identity' => payload['contact_identity'],
                'enabled' => payload['enabled'],
                'integration_type' => payload['integration_type'],
                'integration' => payload['integration'],
                'long_lived' => payload['long_lived'],
                'janitor_enabled' => payload['janitor_enabled'],
                'url' => payload['url'],
            }

            # Context
            @instance_context = nil
            @params = {'sid' => sid || @properties['sid'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [FlexFlowContext] FlexFlowContext for this FlexFlowInstance
          def context
            unless @instance_context
              @instance_context = FlexFlowContext.new(@version, @params['sid'], )
            end
            @instance_context
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
          # @return [Time] The ISO 8601 date and time in GMT when the resource was last updated
          def date_updated
            @properties['date_updated']
          end

          ##
          # @return [String] The unique string that identifies the resource
          def sid
            @properties['sid']
          end

          ##
          # @return [String] The string that you assigned to describe the resource
          def friendly_name
            @properties['friendly_name']
          end

          ##
          # @return [String] The SID of the chat service
          def chat_service_sid
            @properties['chat_service_sid']
          end

          ##
          # @return [flex_flow.ChannelType] The channel type
          def channel_type
            @properties['channel_type']
          end

          ##
          # @return [String] The channel contact's Identity
          def contact_identity
            @properties['contact_identity']
          end

          ##
          # @return [Boolean] Whether the Flex Flow is enabled
          def enabled
            @properties['enabled']
          end

          ##
          # @return [flex_flow.IntegrationType] The software that will handle inbound messages.
          def integration_type
            @properties['integration_type']
          end

          ##
          # @return [Hash] An object that contains specific parameters for the integration
          def integration
            @properties['integration']
          end

          ##
          # @return [Boolean] Re-use this chat channel for future interactions with a contact
          def long_lived
            @properties['long_lived']
          end

          ##
          # @return [Boolean] Remove active Proxy sessions if the corresponding Task is deleted.
          def janitor_enabled
            @properties['janitor_enabled']
          end

          ##
          # @return [String] The absolute URL of the Flex Flow resource
          def url
            @properties['url']
          end

          ##
          # Fetch the FlexFlowInstance
          # @return [FlexFlowInstance] Fetched FlexFlowInstance
          def fetch
            context.fetch
          end

          ##
          # Update the FlexFlowInstance
          # @param [String] friendly_name A descriptive string that you create to describe
          #   the Flex Flow resource.
          # @param [String] chat_service_sid The SID of the chat service.
          # @param [flex_flow.ChannelType] channel_type The channel type. One of `web`,
          #   `facebook`, `sms`, `whatsapp`, `line` or `custom`. By default, Studio’s Send to
          #   Flex widget passes it on to the Task attributes for Tasks created based on this
          #   Flex Flow. The Task attributes will be used by the Flex UI to render the
          #   respective Task as appropriate (applying channel-specific design and length
          #   limits). If `channelType` is `facebook`, `whatsapp` or `line`, the Send to Flex
          #   widget should set the Task Channel to Programmable Chat.
          # @param [String] contact_identity The channel contact's Identity.
          # @param [Boolean] enabled Whether the new Flex Flow is enabled.
          # @param [flex_flow.IntegrationType] integration_type The software that will
          #   handle inbound messages. {Integration
          #   Type}[https://www.twilio.com/docs/flex/developer/messaging/manage-flows#integration-types]
          #   can be: `studio`, `external`, or `task`.
          # @param [String] integration_flow_sid The SID of the Studio Flow. Required when
          #   `integrationType` is `studio`.
          # @param [String] integration_url The URL of the external webhook. Required when
          #   `integrationType` is `external`.
          # @param [String] integration_workspace_sid The Workspace SID for a new Task.
          #   Required when `integrationType` is `task`.
          # @param [String] integration_workflow_sid The Workflow SID for a new Task.
          #   Required when `integrationType` is `task`.
          # @param [String] integration_channel The Task Channel SID (TCXXXX) or unique name
          #   (e.g., `sms`) to use for the Task that will be created. Applicable and required
          #   when `integrationType` is `task`. The default value is `default`.
          # @param [String] integration_timeout The Task timeout in seconds for a new Task.
          #   Default is 86,400 seconds (24 hours). Optional when `integrationType` is `task`,
          #   not applicable otherwise.
          # @param [String] integration_priority The Task priority of a new Task. The
          #   default priority is 0. Optional when `integrationType` is `task`, not applicable
          #   otherwise.
          # @param [Boolean] integration_creation_on_message In the context of outbound
          #   messaging, defines whether to create a Task immediately (and therefore reserve
          #   the conversation to current agent), or delay Task creation until the customer
          #   sends the first response. Set to false to create immediately, true to delay Task
          #   creation. This setting is only applicable for outbound messaging.
          # @param [Boolean] long_lived When enabled, Flex will keep the chat channel active
          #   so that it may be used for subsequent interactions with a contact identity.
          #   Defaults to `false`.
          # @param [Boolean] janitor_enabled When enabled, the Messaging Channel Janitor
          #   will remove active Proxy sessions if the associated Task is deleted outside of
          #   the Flex UI. Defaults to `false`.
          # @param [String] integration_retry_count The number of times to retry the Studio
          #   Flow or webhook in case of failure. Takes integer values from 0 to 3 with the
          #   default being 3. Optional when `integrationType` is `studio` or `external`, not
          #   applicable otherwise.
          # @return [FlexFlowInstance] Updated FlexFlowInstance
          def update(friendly_name: :unset, chat_service_sid: :unset, channel_type: :unset, contact_identity: :unset, enabled: :unset, integration_type: :unset, integration_flow_sid: :unset, integration_url: :unset, integration_workspace_sid: :unset, integration_workflow_sid: :unset, integration_channel: :unset, integration_timeout: :unset, integration_priority: :unset, integration_creation_on_message: :unset, long_lived: :unset, janitor_enabled: :unset, integration_retry_count: :unset)
            context.update(
                friendly_name: friendly_name,
                chat_service_sid: chat_service_sid,
                channel_type: channel_type,
                contact_identity: contact_identity,
                enabled: enabled,
                integration_type: integration_type,
                integration_flow_sid: integration_flow_sid,
                integration_url: integration_url,
                integration_workspace_sid: integration_workspace_sid,
                integration_workflow_sid: integration_workflow_sid,
                integration_channel: integration_channel,
                integration_timeout: integration_timeout,
                integration_priority: integration_priority,
                integration_creation_on_message: integration_creation_on_message,
                long_lived: long_lived,
                janitor_enabled: janitor_enabled,
                integration_retry_count: integration_retry_count,
            )
          end

          ##
          # Delete the FlexFlowInstance
          # @return [Boolean] true if delete succeeds, false otherwise
          def delete
            context.delete
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.FlexApi.V1.FlexFlowInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.FlexApi.V1.FlexFlowInstance #{values}>"
          end
        end
      end
    end
  end
end
