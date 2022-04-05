##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Textgrid
  module REST
    class Taskrouter < Domain
      class V1 < Version
        class WorkspaceList < ListResource
          ##
          # Initialize the WorkspaceList
          # @param [Version] version Version that contains the resource
          # @return [WorkspaceList] WorkspaceList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Workspaces"
          end

          ##
          # Lists WorkspaceInstance records from the API as a list.
          # Unlike stream(), this operation is eager and will load `limit` records into
          # memory before returning.
          # @param [String] friendly_name The `friendly_name` of the Workspace resources to
          #   read. For example `Customer Support` or `2014 Election Campaign`.
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
          # Streams WorkspaceInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [String] friendly_name The `friendly_name` of the Workspace resources to
          #   read. For example `Customer Support` or `2014 Election Campaign`.
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
          # When passed a block, yields WorkspaceInstance records from the API.
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
          # Retrieve a single page of WorkspaceInstance records from the API.
          # Request is executed immediately.
          # @param [String] friendly_name The `friendly_name` of the Workspace resources to
          #   read. For example `Customer Support` or `2014 Election Campaign`.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of WorkspaceInstance
          def page(friendly_name: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
            params = Textgrid::Values.of({
                'FriendlyName' => friendly_name,
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            })

            response = @version.page('GET', @uri, params: params)

            WorkspacePage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of WorkspaceInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of WorkspaceInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            WorkspacePage.new(@version, response, @solution)
          end

          ##
          # Create the WorkspaceInstance
          # @param [String] friendly_name A descriptive string that you create to describe
          #   the Workspace resource. It can be up to 64 characters long. For example:
          #   `Customer Support` or `2014 Election Campaign`.
          # @param [String] event_callback_url The URL we should call when an event occurs.
          #   If provided, the Workspace will publish events to this URL, for example, to
          #   collect data for reporting. See {Workspace
          #   Events}[https://www.twilio.com/docs/taskrouter/api/event] for more information.
          #   This parameter supports Twilio's {Webhooks (HTTP callbacks) Connection
          #   Overrides}[https://www.twilio.com/docs/usage/webhooks/webhooks-connection-overrides].
          # @param [String] events_filter The list of Workspace events for which to call
          #   event_callback_url. For example, if `EventsFilter=task.created, task.canceled,
          #   worker.activity.update`, then TaskRouter will call event_callback_url only when
          #   a task is created, canceled, or a Worker activity is updated.
          # @param [Boolean] multi_task_enabled Whether to enable multi-tasking. Can be:
          #   `true` to enable multi-tasking, or `false` to disable it. However, all
          #   workspaces should be created as multi-tasking. The default is `true`.
          #   Multi-tasking allows Workers to handle multiple Tasks simultaneously. When
          #   enabled (`true`), each Worker can receive parallel reservations up to the
          #   per-channel maximums defined in the Workers section. In single-tasking mode
          #   (legacy mode), each Worker will only receive a new reservation when the previous
          #   task is completed. Learn more at
          #   {Multitasking}[https://www.twilio.com/docs/taskrouter/multitasking].
          # @param [String] template An available template name. Can be: `NONE` or `FIFO`
          #   and the default is `NONE`. Pre-configures the Workspace with the Workflow and
          #   Activities specified in the template. `NONE` will create a Workspace with only a
          #   set of default activities. `FIFO` will configure TaskRouter with a set of
          #   default activities and a single TaskQueue for first-in, first-out distribution,
          #   which can be useful when you are getting started with TaskRouter.
          # @param [workspace.QueueOrder] prioritize_queue_order The type of TaskQueue to
          #   prioritize when Workers are receiving Tasks from both types of TaskQueues. Can
          #   be: `LIFO` or `FIFO` and the default is `FIFO`. For more information, see {Queue
          #   Ordering}[https://www.twilio.com/docs/taskrouter/queue-ordering-last-first-out-lifo].
          # @return [WorkspaceInstance] Created WorkspaceInstance
          def create(friendly_name: nil, event_callback_url: :unset, events_filter: :unset, multi_task_enabled: :unset, template: :unset, prioritize_queue_order: :unset)
            data = Textgrid::Values.of({
                'FriendlyName' => friendly_name,
                'EventCallbackUrl' => event_callback_url,
                'EventsFilter' => events_filter,
                'MultiTaskEnabled' => multi_task_enabled,
                'Template' => template,
                'PrioritizeQueueOrder' => prioritize_queue_order,
            })

            payload = @version.create('POST', @uri, data: data)

            WorkspaceInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Taskrouter.V1.WorkspaceList>'
          end
        end

        class WorkspacePage < Page
          ##
          # Initialize the WorkspacePage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [WorkspacePage] WorkspacePage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of WorkspaceInstance
          # @param [Hash] payload Payload response from the API
          # @return [WorkspaceInstance] WorkspaceInstance
          def get_instance(payload)
            WorkspaceInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Taskrouter.V1.WorkspacePage>'
          end
        end

        class WorkspaceContext < InstanceContext
          ##
          # Initialize the WorkspaceContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The SID of the Workspace resource to fetch.
          # @return [WorkspaceContext] WorkspaceContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {sid: sid, }
            @uri = "/Workspaces/#{@solution[:sid]}"

            # Dependents
            @activities = nil
            @events = nil
            @tasks = nil
            @task_queues = nil
            @workers = nil
            @workflows = nil
            @statistics = nil
            @real_time_statistics = nil
            @cumulative_statistics = nil
            @task_channels = nil
          end

          ##
          # Fetch the WorkspaceInstance
          # @return [WorkspaceInstance] Fetched WorkspaceInstance
          def fetch
            payload = @version.fetch('GET', @uri)

            WorkspaceInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Update the WorkspaceInstance
          # @param [String] default_activity_sid The SID of the Activity that will be used
          #   when new Workers are created in the Workspace.
          # @param [String] event_callback_url The URL we should call when an event occurs.
          #   See {Workspace Events}[https://www.twilio.com/docs/taskrouter/api/event] for
          #   more information. This parameter supports Twilio's {Webhooks (HTTP callbacks)
          #   Connection
          #   Overrides}[https://www.twilio.com/docs/usage/webhooks/webhooks-connection-overrides].
          # @param [String] events_filter The list of Workspace events for which to call
          #   event_callback_url. For example if
          #   `EventsFilter=task.created,task.canceled,worker.activity.update`, then
          #   TaskRouter will call event_callback_url only when a task is created, canceled,
          #   or a Worker activity is updated.
          # @param [String] friendly_name A descriptive string that you create to describe
          #   the Workspace resource. For example: `Sales Call Center` or `Customer Support
          #   Team`.
          # @param [Boolean] multi_task_enabled Whether to enable multi-tasking. Can be:
          #   `true` to enable multi-tasking, or `false` to disable it. However, all
          #   workspaces should be maintained as multi-tasking. There is no default when
          #   omitting this parameter. A multi-tasking Workspace can't be updated to
          #   single-tasking unless it is not a Flex Project and another (legacy)
          #   single-tasking Workspace exists. Multi-tasking allows Workers to handle multiple
          #   Tasks simultaneously. In multi-tasking mode, each Worker can receive parallel
          #   reservations up to the per-channel maximums defined in the Workers section. In
          #   single-tasking mode (legacy mode), each Worker will only receive a new
          #   reservation when the previous task is completed. Learn more at
          #   {Multitasking}[https://www.twilio.com/docs/taskrouter/multitasking].
          # @param [String] timeout_activity_sid The SID of the Activity that will be
          #   assigned to a Worker when a Task reservation times out without a response.
          # @param [workspace.QueueOrder] prioritize_queue_order The type of TaskQueue to
          #   prioritize when Workers are receiving Tasks from both types of TaskQueues. Can
          #   be: `LIFO` or `FIFO`. For more information, see {Queue
          #   Ordering}[https://www.twilio.com/docs/taskrouter/queue-ordering-last-first-out-lifo].
          # @return [WorkspaceInstance] Updated WorkspaceInstance
          def update(default_activity_sid: :unset, event_callback_url: :unset, events_filter: :unset, friendly_name: :unset, multi_task_enabled: :unset, timeout_activity_sid: :unset, prioritize_queue_order: :unset)
            data = Textgrid::Values.of({
                'DefaultActivitySid' => default_activity_sid,
                'EventCallbackUrl' => event_callback_url,
                'EventsFilter' => events_filter,
                'FriendlyName' => friendly_name,
                'MultiTaskEnabled' => multi_task_enabled,
                'TimeoutActivitySid' => timeout_activity_sid,
                'PrioritizeQueueOrder' => prioritize_queue_order,
            })

            payload = @version.update('POST', @uri, data: data)

            WorkspaceInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Delete the WorkspaceInstance
          # @return [Boolean] true if delete succeeds, false otherwise
          def delete
             @version.delete('DELETE', @uri)
          end

          ##
          # Access the activities
          # @return [ActivityList]
          # @return [ActivityContext] if sid was passed.
          def activities(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return ActivityContext.new(@version, @solution[:sid], sid, )
            end

            unless @activities
              @activities = ActivityList.new(@version, workspace_sid: @solution[:sid], )
            end

            @activities
          end

          ##
          # Access the events
          # @return [EventList]
          # @return [EventContext] if sid was passed.
          def events(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return EventContext.new(@version, @solution[:sid], sid, )
            end

            unless @events
              @events = EventList.new(@version, workspace_sid: @solution[:sid], )
            end

            @events
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
              @tasks = TaskList.new(@version, workspace_sid: @solution[:sid], )
            end

            @tasks
          end

          ##
          # Access the task_queues
          # @return [TaskQueueList]
          # @return [TaskQueueContext] if sid was passed.
          def task_queues(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return TaskQueueContext.new(@version, @solution[:sid], sid, )
            end

            unless @task_queues
              @task_queues = TaskQueueList.new(@version, workspace_sid: @solution[:sid], )
            end

            @task_queues
          end

          ##
          # Access the workers
          # @return [WorkerList]
          # @return [WorkerContext] if sid was passed.
          def workers(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return WorkerContext.new(@version, @solution[:sid], sid, )
            end

            unless @workers
              @workers = WorkerList.new(@version, workspace_sid: @solution[:sid], )
            end

            @workers
          end

          ##
          # Access the workflows
          # @return [WorkflowList]
          # @return [WorkflowContext] if sid was passed.
          def workflows(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return WorkflowContext.new(@version, @solution[:sid], sid, )
            end

            unless @workflows
              @workflows = WorkflowList.new(@version, workspace_sid: @solution[:sid], )
            end

            @workflows
          end

          ##
          # Access the statistics
          # @return [WorkspaceStatisticsList]
          # @return [WorkspaceStatisticsContext]
          def statistics
            WorkspaceStatisticsContext.new(@version, @solution[:sid], )
          end

          ##
          # Access the real_time_statistics
          # @return [WorkspaceRealTimeStatisticsList]
          # @return [WorkspaceRealTimeStatisticsContext]
          def real_time_statistics
            WorkspaceRealTimeStatisticsContext.new(@version, @solution[:sid], )
          end

          ##
          # Access the cumulative_statistics
          # @return [WorkspaceCumulativeStatisticsList]
          # @return [WorkspaceCumulativeStatisticsContext]
          def cumulative_statistics
            WorkspaceCumulativeStatisticsContext.new(@version, @solution[:sid], )
          end

          ##
          # Access the task_channels
          # @return [TaskChannelList]
          # @return [TaskChannelContext] if sid was passed.
          def task_channels(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return TaskChannelContext.new(@version, @solution[:sid], sid, )
            end

            unless @task_channels
              @task_channels = TaskChannelList.new(@version, workspace_sid: @solution[:sid], )
            end

            @task_channels
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Taskrouter.V1.WorkspaceContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Taskrouter.V1.WorkspaceContext #{context}>"
          end
        end

        class WorkspaceInstance < InstanceResource
          ##
          # Initialize the WorkspaceInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The SID of the Workspace resource to fetch.
          # @return [WorkspaceInstance] WorkspaceInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'account_sid' => payload['account_sid'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                'default_activity_name' => payload['default_activity_name'],
                'default_activity_sid' => payload['default_activity_sid'],
                'event_callback_url' => payload['event_callback_url'],
                'events_filter' => payload['events_filter'],
                'friendly_name' => payload['friendly_name'],
                'multi_task_enabled' => payload['multi_task_enabled'],
                'sid' => payload['sid'],
                'timeout_activity_name' => payload['timeout_activity_name'],
                'timeout_activity_sid' => payload['timeout_activity_sid'],
                'prioritize_queue_order' => payload['prioritize_queue_order'],
                'url' => payload['url'],
                'links' => payload['links'],
            }

            # Context
            @instance_context = nil
            @params = {'sid' => sid || @properties['sid'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [WorkspaceContext] WorkspaceContext for this WorkspaceInstance
          def context
            unless @instance_context
              @instance_context = WorkspaceContext.new(@version, @params['sid'], )
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
          # @return [String] The name of the default activity
          def default_activity_name
            @properties['default_activity_name']
          end

          ##
          # @return [String] The SID of the Activity that will be used when new Workers are created in the Workspace
          def default_activity_sid
            @properties['default_activity_sid']
          end

          ##
          # @return [String] The URL we call when an event occurs
          def event_callback_url
            @properties['event_callback_url']
          end

          ##
          # @return [String] The list of Workspace events for which to call event_callback_url
          def events_filter
            @properties['events_filter']
          end

          ##
          # @return [String] The string that you assigned to describe the Workspace resource
          def friendly_name
            @properties['friendly_name']
          end

          ##
          # @return [Boolean] Whether multi-tasking is enabled
          def multi_task_enabled
            @properties['multi_task_enabled']
          end

          ##
          # @return [String] The unique string that identifies the resource
          def sid
            @properties['sid']
          end

          ##
          # @return [String] The name of the timeout activity
          def timeout_activity_name
            @properties['timeout_activity_name']
          end

          ##
          # @return [String] The SID of the Activity that will be assigned to a Worker when a Task reservation times out without a response
          def timeout_activity_sid
            @properties['timeout_activity_sid']
          end

          ##
          # @return [workspace.QueueOrder] The type of TaskQueue to prioritize when Workers are receiving Tasks from both types of TaskQueues
          def prioritize_queue_order
            @properties['prioritize_queue_order']
          end

          ##
          # @return [String] The absolute URL of the Workspace resource
          def url
            @properties['url']
          end

          ##
          # @return [String] The URLs of related resources
          def links
            @properties['links']
          end

          ##
          # Fetch the WorkspaceInstance
          # @return [WorkspaceInstance] Fetched WorkspaceInstance
          def fetch
            context.fetch
          end

          ##
          # Update the WorkspaceInstance
          # @param [String] default_activity_sid The SID of the Activity that will be used
          #   when new Workers are created in the Workspace.
          # @param [String] event_callback_url The URL we should call when an event occurs.
          #   See {Workspace Events}[https://www.twilio.com/docs/taskrouter/api/event] for
          #   more information. This parameter supports Twilio's {Webhooks (HTTP callbacks)
          #   Connection
          #   Overrides}[https://www.twilio.com/docs/usage/webhooks/webhooks-connection-overrides].
          # @param [String] events_filter The list of Workspace events for which to call
          #   event_callback_url. For example if
          #   `EventsFilter=task.created,task.canceled,worker.activity.update`, then
          #   TaskRouter will call event_callback_url only when a task is created, canceled,
          #   or a Worker activity is updated.
          # @param [String] friendly_name A descriptive string that you create to describe
          #   the Workspace resource. For example: `Sales Call Center` or `Customer Support
          #   Team`.
          # @param [Boolean] multi_task_enabled Whether to enable multi-tasking. Can be:
          #   `true` to enable multi-tasking, or `false` to disable it. However, all
          #   workspaces should be maintained as multi-tasking. There is no default when
          #   omitting this parameter. A multi-tasking Workspace can't be updated to
          #   single-tasking unless it is not a Flex Project and another (legacy)
          #   single-tasking Workspace exists. Multi-tasking allows Workers to handle multiple
          #   Tasks simultaneously. In multi-tasking mode, each Worker can receive parallel
          #   reservations up to the per-channel maximums defined in the Workers section. In
          #   single-tasking mode (legacy mode), each Worker will only receive a new
          #   reservation when the previous task is completed. Learn more at
          #   {Multitasking}[https://www.twilio.com/docs/taskrouter/multitasking].
          # @param [String] timeout_activity_sid The SID of the Activity that will be
          #   assigned to a Worker when a Task reservation times out without a response.
          # @param [workspace.QueueOrder] prioritize_queue_order The type of TaskQueue to
          #   prioritize when Workers are receiving Tasks from both types of TaskQueues. Can
          #   be: `LIFO` or `FIFO`. For more information, see {Queue
          #   Ordering}[https://www.twilio.com/docs/taskrouter/queue-ordering-last-first-out-lifo].
          # @return [WorkspaceInstance] Updated WorkspaceInstance
          def update(default_activity_sid: :unset, event_callback_url: :unset, events_filter: :unset, friendly_name: :unset, multi_task_enabled: :unset, timeout_activity_sid: :unset, prioritize_queue_order: :unset)
            context.update(
                default_activity_sid: default_activity_sid,
                event_callback_url: event_callback_url,
                events_filter: events_filter,
                friendly_name: friendly_name,
                multi_task_enabled: multi_task_enabled,
                timeout_activity_sid: timeout_activity_sid,
                prioritize_queue_order: prioritize_queue_order,
            )
          end

          ##
          # Delete the WorkspaceInstance
          # @return [Boolean] true if delete succeeds, false otherwise
          def delete
            context.delete
          end

          ##
          # Access the activities
          # @return [activities] activities
          def activities
            context.activities
          end

          ##
          # Access the events
          # @return [events] events
          def events
            context.events
          end

          ##
          # Access the tasks
          # @return [tasks] tasks
          def tasks
            context.tasks
          end

          ##
          # Access the task_queues
          # @return [task_queues] task_queues
          def task_queues
            context.task_queues
          end

          ##
          # Access the workers
          # @return [workers] workers
          def workers
            context.workers
          end

          ##
          # Access the workflows
          # @return [workflows] workflows
          def workflows
            context.workflows
          end

          ##
          # Access the statistics
          # @return [statistics] statistics
          def statistics
            context.statistics
          end

          ##
          # Access the real_time_statistics
          # @return [real_time_statistics] real_time_statistics
          def real_time_statistics
            context.real_time_statistics
          end

          ##
          # Access the cumulative_statistics
          # @return [cumulative_statistics] cumulative_statistics
          def cumulative_statistics
            context.cumulative_statistics
          end

          ##
          # Access the task_channels
          # @return [task_channels] task_channels
          def task_channels
            context.task_channels
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Taskrouter.V1.WorkspaceInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Taskrouter.V1.WorkspaceInstance #{values}>"
          end
        end
      end
    end
  end
end
