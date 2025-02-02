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
        class AssistantList < ListResource
          ##
          # Initialize the AssistantList
          # @param [Version] version Version that contains the resource
          # @return [AssistantList] AssistantList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Assistants"
          end

          ##
          # Lists AssistantInstance records from the API as a list.
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
          # Streams AssistantInstance records from the API as an Enumerable.
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
          # When passed a block, yields AssistantInstance records from the API.
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
          # Retrieve a single page of AssistantInstance records from the API.
          # Request is executed immediately.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of AssistantInstance
          def page(page_token: :unset, page_number: :unset, page_size: :unset)
            params = Textgrid::Values.of({
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            })

            response = @version.page('GET', @uri, params: params)

            AssistantPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of AssistantInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of AssistantInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            AssistantPage.new(@version, response, @solution)
          end

          ##
          # Create the AssistantInstance
          # @param [String] friendly_name A descriptive string that you create to describe
          #   the new resource. It is not unique and can be up to 255 characters long.
          # @param [Boolean] log_queries Whether queries should be logged and kept after
          #   training. Can be: `true` or `false` and defaults to `true`. If `true`, queries
          #   are stored for 30 days, and then deleted. If `false`, no queries are stored.
          # @param [String] unique_name An application-defined string that uniquely
          #   identifies the new resource. It can be used as an alternative to the `sid` in
          #   the URL path to address the resource. The first 64 characters must be unique.
          # @param [String] callback_url Reserved.
          # @param [String] callback_events Reserved.
          # @param [Hash] style_sheet The JSON string that defines the Assistant's {style
          #   sheet}[https://www.twilio.com/docs/autopilot/api/assistant/stylesheet]
          # @param [Hash] defaults A JSON object that defines the Assistant's {default
          #   tasks}[https://www.twilio.com/docs/autopilot/api/assistant/defaults] for various
          #   scenarios, including initiation actions and fallback tasks.
          # @return [AssistantInstance] Created AssistantInstance
          def create(friendly_name: :unset, log_queries: :unset, unique_name: :unset, callback_url: :unset, callback_events: :unset, style_sheet: :unset, defaults: :unset)
            data = Textgrid::Values.of({
                'FriendlyName' => friendly_name,
                'LogQueries' => log_queries,
                'UniqueName' => unique_name,
                'CallbackUrl' => callback_url,
                'CallbackEvents' => callback_events,
                'StyleSheet' => Twilio.serialize_object(style_sheet),
                'Defaults' => Twilio.serialize_object(defaults),
            })

            payload = @version.create('POST', @uri, data: data)

            AssistantInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Autopilot.V1.AssistantList>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class AssistantPage < Page
          ##
          # Initialize the AssistantPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [AssistantPage] AssistantPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of AssistantInstance
          # @param [Hash] payload Payload response from the API
          # @return [AssistantInstance] AssistantInstance
          def get_instance(payload)
            AssistantInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Autopilot.V1.AssistantPage>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class AssistantContext < InstanceContext
          ##
          # Initialize the AssistantContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The Twilio-provided string that uniquely identifies the
          #   Assistant resource to fetch.
          # @return [AssistantContext] AssistantContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {sid: sid, }
            @uri = "/Assistants/#{@solution[:sid]}"

            # Dependents
            @field_types = nil
            @tasks = nil
            @model_builds = nil
            @queries = nil
            @style_sheet = nil
            @defaults = nil
            @dialogues = nil
            @webhooks = nil
          end

          ##
          # Fetch the AssistantInstance
          # @return [AssistantInstance] Fetched AssistantInstance
          def fetch
            payload = @version.fetch('GET', @uri)

            AssistantInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Update the AssistantInstance
          # @param [String] friendly_name A descriptive string that you create to describe
          #   the resource. It is not unique and can be up to 255 characters long.
          # @param [Boolean] log_queries Whether queries should be logged and kept after
          #   training. Can be: `true` or `false` and defaults to `true`. If `true`, queries
          #   are stored for 30 days, and then deleted. If `false`, no queries are stored.
          # @param [String] unique_name An application-defined string that uniquely
          #   identifies the resource. It can be used as an alternative to the `sid` in the
          #   URL path to address the resource. The first 64 characters must be unique.
          # @param [String] callback_url Reserved.
          # @param [String] callback_events Reserved.
          # @param [Hash] style_sheet The JSON string that defines the Assistant's {style
          #   sheet}[https://www.twilio.com/docs/autopilot/api/assistant/stylesheet]
          # @param [Hash] defaults A JSON object that defines the Assistant's {default
          #   tasks}[https://www.twilio.com/docs/autopilot/api/assistant/defaults] for various
          #   scenarios, including initiation actions and fallback tasks.
          # @param [String] development_stage A string describing the state of the
          #   assistant.
          # @return [AssistantInstance] Updated AssistantInstance
          def update(friendly_name: :unset, log_queries: :unset, unique_name: :unset, callback_url: :unset, callback_events: :unset, style_sheet: :unset, defaults: :unset, development_stage: :unset)
            data = Textgrid::Values.of({
                'FriendlyName' => friendly_name,
                'LogQueries' => log_queries,
                'UniqueName' => unique_name,
                'CallbackUrl' => callback_url,
                'CallbackEvents' => callback_events,
                'StyleSheet' => Twilio.serialize_object(style_sheet),
                'Defaults' => Twilio.serialize_object(defaults),
                'DevelopmentStage' => development_stage,
            })

            payload = @version.update('POST', @uri, data: data)

            AssistantInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Delete the AssistantInstance
          # @return [Boolean] true if delete succeeds, false otherwise
          def delete
             @version.delete('DELETE', @uri)
          end

          ##
          # Access the field_types
          # @return [FieldTypeList]
          # @return [FieldTypeContext] if sid was passed.
          def field_types(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return FieldTypeContext.new(@version, @solution[:sid], sid, )
            end

            unless @field_types
              @field_types = FieldTypeList.new(@version, assistant_sid: @solution[:sid], )
            end

            @field_types
          end

          ##
          # Access the tasks
          # @return [TaskList]
          # @return [TaskContext] if sid was passed.
          def tasks(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return TaskContext.new(@version, @solution[:sid], sid, )
            end

            unless @tasks
              @tasks = TaskList.new(@version, assistant_sid: @solution[:sid], )
            end

            @tasks
          end

          ##
          # Access the model_builds
          # @return [ModelBuildList]
          # @return [ModelBuildContext] if sid was passed.
          def model_builds(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return ModelBuildContext.new(@version, @solution[:sid], sid, )
            end

            unless @model_builds
              @model_builds = ModelBuildList.new(@version, assistant_sid: @solution[:sid], )
            end

            @model_builds
          end

          ##
          # Access the queries
          # @return [QueryList]
          # @return [QueryContext] if sid was passed.
          def queries(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return QueryContext.new(@version, @solution[:sid], sid, )
            end

            unless @queries
              @queries = QueryList.new(@version, assistant_sid: @solution[:sid], )
            end

            @queries
          end

          ##
          # Access the style_sheet
          # @return [StyleSheetList]
          # @return [StyleSheetContext]
          def style_sheet
            StyleSheetContext.new(@version, @solution[:sid], )
          end

          ##
          # Access the defaults
          # @return [DefaultsList]
          # @return [DefaultsContext]
          def defaults
            DefaultsContext.new(@version, @solution[:sid], )
          end

          ##
          # Access the dialogues
          # @return [DialogueList]
          # @return [DialogueContext] if sid was passed.
          def dialogues(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return DialogueContext.new(@version, @solution[:sid], sid, )
            end

            unless @dialogues
              @dialogues = DialogueList.new(@version, assistant_sid: @solution[:sid], )
            end

            @dialogues
          end

          ##
          # Access the webhooks
          # @return [WebhookList]
          # @return [WebhookContext] if sid was passed.
          def webhooks(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return WebhookContext.new(@version, @solution[:sid], sid, )
            end

            unless @webhooks
              @webhooks = WebhookList.new(@version, assistant_sid: @solution[:sid], )
            end

            @webhooks
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Autopilot.V1.AssistantContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Autopilot.V1.AssistantContext #{context}>"
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class AssistantInstance < InstanceResource
          ##
          # Initialize the AssistantInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The Twilio-provided string that uniquely identifies the
          #   Assistant resource to fetch.
          # @return [AssistantInstance] AssistantInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'account_sid' => payload['account_sid'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                'friendly_name' => payload['friendly_name'],
                'latest_model_build_sid' => payload['latest_model_build_sid'],
                'links' => payload['links'],
                'log_queries' => payload['log_queries'],
                'development_stage' => payload['development_stage'],
                'needs_model_build' => payload['needs_model_build'],
                'sid' => payload['sid'],
                'unique_name' => payload['unique_name'],
                'url' => payload['url'],
                'callback_url' => payload['callback_url'],
                'callback_events' => payload['callback_events'],
            }

            # Context
            @instance_context = nil
            @params = {'sid' => sid || @properties['sid'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [AssistantContext] AssistantContext for this AssistantInstance
          def context
            unless @instance_context
              @instance_context = AssistantContext.new(@version, @params['sid'], )
            end
            @instance_context
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
          # @return [String] The string that you assigned to describe the resource
          def friendly_name
            @properties['friendly_name']
          end

          ##
          # @return [String] Reserved
          def latest_model_build_sid
            @properties['latest_model_build_sid']
          end

          ##
          # @return [String] A list of the URLs of the Assistant's related resources
          def links
            @properties['links']
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
          # @return [Boolean] Whether model needs to be rebuilt
          def needs_model_build
            @properties['needs_model_build']
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
          # @return [String] The absolute URL of the Assistant resource
          def url
            @properties['url']
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
          # Fetch the AssistantInstance
          # @return [AssistantInstance] Fetched AssistantInstance
          def fetch
            context.fetch
          end

          ##
          # Update the AssistantInstance
          # @param [String] friendly_name A descriptive string that you create to describe
          #   the resource. It is not unique and can be up to 255 characters long.
          # @param [Boolean] log_queries Whether queries should be logged and kept after
          #   training. Can be: `true` or `false` and defaults to `true`. If `true`, queries
          #   are stored for 30 days, and then deleted. If `false`, no queries are stored.
          # @param [String] unique_name An application-defined string that uniquely
          #   identifies the resource. It can be used as an alternative to the `sid` in the
          #   URL path to address the resource. The first 64 characters must be unique.
          # @param [String] callback_url Reserved.
          # @param [String] callback_events Reserved.
          # @param [Hash] style_sheet The JSON string that defines the Assistant's {style
          #   sheet}[https://www.twilio.com/docs/autopilot/api/assistant/stylesheet]
          # @param [Hash] defaults A JSON object that defines the Assistant's {default
          #   tasks}[https://www.twilio.com/docs/autopilot/api/assistant/defaults] for various
          #   scenarios, including initiation actions and fallback tasks.
          # @param [String] development_stage A string describing the state of the
          #   assistant.
          # @return [AssistantInstance] Updated AssistantInstance
          def update(friendly_name: :unset, log_queries: :unset, unique_name: :unset, callback_url: :unset, callback_events: :unset, style_sheet: :unset, defaults: :unset, development_stage: :unset)
            context.update(
                friendly_name: friendly_name,
                log_queries: log_queries,
                unique_name: unique_name,
                callback_url: callback_url,
                callback_events: callback_events,
                style_sheet: style_sheet,
                defaults: defaults,
                development_stage: development_stage,
            )
          end

          ##
          # Delete the AssistantInstance
          # @return [Boolean] true if delete succeeds, false otherwise
          def delete
            context.delete
          end

          ##
          # Access the field_types
          # @return [field_types] field_types
          def field_types
            context.field_types
          end

          ##
          # Access the tasks
          # @return [tasks] tasks
          def tasks
            context.tasks
          end

          ##
          # Access the model_builds
          # @return [model_builds] model_builds
          def model_builds
            context.model_builds
          end

          ##
          # Access the queries
          # @return [queries] queries
          def queries
            context.queries
          end

          ##
          # Access the style_sheet
          # @return [style_sheet] style_sheet
          def style_sheet
            context.style_sheet
          end

          ##
          # Access the defaults
          # @return [defaults] defaults
          def defaults
            context.defaults
          end

          ##
          # Access the dialogues
          # @return [dialogues] dialogues
          def dialogues
            context.dialogues
          end

          ##
          # Access the webhooks
          # @return [webhooks] webhooks
          def webhooks
            context.webhooks
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Autopilot.V1.AssistantInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Autopilot.V1.AssistantInstance #{values}>"
          end
        end
      end
    end
  end
end
