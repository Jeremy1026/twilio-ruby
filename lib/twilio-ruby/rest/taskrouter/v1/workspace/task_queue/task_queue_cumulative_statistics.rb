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
        class WorkspaceContext < InstanceContext
          class TaskQueueContext < InstanceContext
            class TaskQueueCumulativeStatisticsList < ListResource
              ##
              # Initialize the TaskQueueCumulativeStatisticsList
              # @param [Version] version Version that contains the resource
              # @param [String] workspace_sid The SID of the Workspace that contains the
              #   TaskQueue.
              # @param [String] task_queue_sid The SID of the TaskQueue from which these
              #   statistics were calculated.
              # @return [TaskQueueCumulativeStatisticsList] TaskQueueCumulativeStatisticsList
              def initialize(version, workspace_sid: nil, task_queue_sid: nil)
                super(version)

                # Path Solution
                @solution = {workspace_sid: workspace_sid, task_queue_sid: task_queue_sid}
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Taskrouter.V1.TaskQueueCumulativeStatisticsList>'
              end
            end

            class TaskQueueCumulativeStatisticsPage < Page
              ##
              # Initialize the TaskQueueCumulativeStatisticsPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [TaskQueueCumulativeStatisticsPage] TaskQueueCumulativeStatisticsPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of TaskQueueCumulativeStatisticsInstance
              # @param [Hash] payload Payload response from the API
              # @return [TaskQueueCumulativeStatisticsInstance] TaskQueueCumulativeStatisticsInstance
              def get_instance(payload)
                TaskQueueCumulativeStatisticsInstance.new(
                    @version,
                    payload,
                    workspace_sid: @solution[:workspace_sid],
                    task_queue_sid: @solution[:task_queue_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Taskrouter.V1.TaskQueueCumulativeStatisticsPage>'
              end
            end

            class TaskQueueCumulativeStatisticsContext < InstanceContext
              ##
              # Initialize the TaskQueueCumulativeStatisticsContext
              # @param [Version] version Version that contains the resource
              # @param [String] workspace_sid The SID of the Workspace with the TaskQueue to
              #   fetch.
              # @param [String] task_queue_sid The SID of the TaskQueue for which to fetch
              #   statistics.
              # @return [TaskQueueCumulativeStatisticsContext] TaskQueueCumulativeStatisticsContext
              def initialize(version, workspace_sid, task_queue_sid)
                super(version)

                # Path Solution
                @solution = {workspace_sid: workspace_sid, task_queue_sid: task_queue_sid, }
                @uri = "/Workspaces/#{@solution[:workspace_sid]}/TaskQueues/#{@solution[:task_queue_sid]}/CumulativeStatistics"
              end

              ##
              # Fetch the TaskQueueCumulativeStatisticsInstance
              # @param [Time] end_date Only calculate statistics from this date and time and
              #   earlier, specified in GMT as an {ISO
              #   8601}[https://en.wikipedia.org/wiki/ISO_8601] date-time.
              # @param [String] minutes Only calculate statistics since this many minutes in the
              #   past. The default is 15 minutes.
              # @param [Time] start_date Only calculate statistics from this date and time and
              #   later, specified in {ISO 8601}[https://en.wikipedia.org/wiki/ISO_8601] format.
              # @param [String] task_channel Only calculate cumulative statistics on this
              #   TaskChannel. Can be the TaskChannel's SID or its `unique_name`, such as `voice`,
              #   `sms`, or `default`.
              # @param [String] split_by_wait_time A comma separated list of values that
              #   describes the thresholds, in seconds, to calculate statistics on. For each
              #   threshold specified, the number of Tasks canceled and reservations accepted
              #   above and below the specified thresholds in seconds are computed. TaskRouter
              #   will calculate statistics on up to 10,000 Tasks/Reservations for any given
              #   threshold.
              # @return [TaskQueueCumulativeStatisticsInstance] Fetched TaskQueueCumulativeStatisticsInstance
              def fetch(end_date: :unset, minutes: :unset, start_date: :unset, task_channel: :unset, split_by_wait_time: :unset)
                params = Textgrid::Values.of({
                    'EndDate' => Twilio.serialize_iso8601_datetime(end_date),
                    'Minutes' => minutes,
                    'StartDate' => Twilio.serialize_iso8601_datetime(start_date),
                    'TaskChannel' => task_channel,
                    'SplitByWaitTime' => split_by_wait_time,
                })

                payload = @version.fetch('GET', @uri, params: params)

                TaskQueueCumulativeStatisticsInstance.new(
                    @version,
                    payload,
                    workspace_sid: @solution[:workspace_sid],
                    task_queue_sid: @solution[:task_queue_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Taskrouter.V1.TaskQueueCumulativeStatisticsContext #{context}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Taskrouter.V1.TaskQueueCumulativeStatisticsContext #{context}>"
              end
            end

            class TaskQueueCumulativeStatisticsInstance < InstanceResource
              ##
              # Initialize the TaskQueueCumulativeStatisticsInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] workspace_sid The SID of the Workspace that contains the
              #   TaskQueue.
              # @param [String] task_queue_sid The SID of the TaskQueue from which these
              #   statistics were calculated.
              # @return [TaskQueueCumulativeStatisticsInstance] TaskQueueCumulativeStatisticsInstance
              def initialize(version, payload, workspace_sid: nil, task_queue_sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'avg_task_acceptance_time' => payload['avg_task_acceptance_time'].to_i,
                    'start_time' => Twilio.deserialize_iso8601_datetime(payload['start_time']),
                    'end_time' => Twilio.deserialize_iso8601_datetime(payload['end_time']),
                    'reservations_created' => payload['reservations_created'].to_i,
                    'reservations_accepted' => payload['reservations_accepted'].to_i,
                    'reservations_rejected' => payload['reservations_rejected'].to_i,
                    'reservations_timed_out' => payload['reservations_timed_out'].to_i,
                    'reservations_canceled' => payload['reservations_canceled'].to_i,
                    'reservations_rescinded' => payload['reservations_rescinded'].to_i,
                    'split_by_wait_time' => payload['split_by_wait_time'],
                    'task_queue_sid' => payload['task_queue_sid'],
                    'wait_duration_until_accepted' => payload['wait_duration_until_accepted'],
                    'wait_duration_until_canceled' => payload['wait_duration_until_canceled'],
                    'wait_duration_in_queue_until_accepted' => payload['wait_duration_in_queue_until_accepted'],
                    'tasks_canceled' => payload['tasks_canceled'].to_i,
                    'tasks_completed' => payload['tasks_completed'].to_i,
                    'tasks_deleted' => payload['tasks_deleted'].to_i,
                    'tasks_entered' => payload['tasks_entered'].to_i,
                    'tasks_moved' => payload['tasks_moved'].to_i,
                    'workspace_sid' => payload['workspace_sid'],
                    'url' => payload['url'],
                }

                # Context
                @instance_context = nil
                @params = {'workspace_sid' => workspace_sid, 'task_queue_sid' => task_queue_sid, }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [TaskQueueCumulativeStatisticsContext] TaskQueueCumulativeStatisticsContext for this TaskQueueCumulativeStatisticsInstance
              def context
                unless @instance_context
                  @instance_context = TaskQueueCumulativeStatisticsContext.new(
                      @version,
                      @params['workspace_sid'],
                      @params['task_queue_sid'],
                  )
                end
                @instance_context
              end

              ##
              # @return [String] The SID of the Account that created the resource
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] The average time in seconds between Task creation and acceptance
              def avg_task_acceptance_time
                @properties['avg_task_acceptance_time']
              end

              ##
              # @return [Time] The beginning of the interval during which these statistics were calculated
              def start_time
                @properties['start_time']
              end

              ##
              # @return [Time] The end of the interval during which these statistics were calculated
              def end_time
                @properties['end_time']
              end

              ##
              # @return [String] The total number of Reservations created for Tasks in the TaskQueue
              def reservations_created
                @properties['reservations_created']
              end

              ##
              # @return [String] The total number of Reservations accepted for Tasks in the TaskQueue
              def reservations_accepted
                @properties['reservations_accepted']
              end

              ##
              # @return [String] The total number of Reservations rejected for Tasks in the TaskQueue
              def reservations_rejected
                @properties['reservations_rejected']
              end

              ##
              # @return [String] The total number of Reservations that timed out for Tasks in the TaskQueue
              def reservations_timed_out
                @properties['reservations_timed_out']
              end

              ##
              # @return [String] The total number of Reservations canceled for Tasks in the TaskQueue
              def reservations_canceled
                @properties['reservations_canceled']
              end

              ##
              # @return [String] The total number of Reservations rescinded
              def reservations_rescinded
                @properties['reservations_rescinded']
              end

              ##
              # @return [Hash] A list of objects that describe the Tasks canceled and reservations accepted above and below the specified thresholds
              def split_by_wait_time
                @properties['split_by_wait_time']
              end

              ##
              # @return [String] The SID of the TaskQueue from which these statistics were calculated
              def task_queue_sid
                @properties['task_queue_sid']
              end

              ##
              # @return [Hash] The wait duration statistics for Tasks accepted while in the TaskQueue
              def wait_duration_until_accepted
                @properties['wait_duration_until_accepted']
              end

              ##
              # @return [Hash] The wait duration statistics for Tasks canceled while in the TaskQueue
              def wait_duration_until_canceled
                @properties['wait_duration_until_canceled']
              end

              ##
              # @return [Hash] The relative wait duration statistics for Tasks accepted while in the TaskQueue
              def wait_duration_in_queue_until_accepted
                @properties['wait_duration_in_queue_until_accepted']
              end

              ##
              # @return [String] The total number of Tasks canceled in the TaskQueue
              def tasks_canceled
                @properties['tasks_canceled']
              end

              ##
              # @return [String] The total number of Tasks completed in the TaskQueue
              def tasks_completed
                @properties['tasks_completed']
              end

              ##
              # @return [String] The total number of Tasks deleted in the TaskQueue
              def tasks_deleted
                @properties['tasks_deleted']
              end

              ##
              # @return [String] The total number of Tasks entered into the TaskQueue
              def tasks_entered
                @properties['tasks_entered']
              end

              ##
              # @return [String] The total number of Tasks that were moved from one queue to another
              def tasks_moved
                @properties['tasks_moved']
              end

              ##
              # @return [String] The SID of the Workspace that contains the TaskQueue
              def workspace_sid
                @properties['workspace_sid']
              end

              ##
              # @return [String] The absolute URL of the TaskQueue statistics resource
              def url
                @properties['url']
              end

              ##
              # Fetch the TaskQueueCumulativeStatisticsInstance
              # @param [Time] end_date Only calculate statistics from this date and time and
              #   earlier, specified in GMT as an {ISO
              #   8601}[https://en.wikipedia.org/wiki/ISO_8601] date-time.
              # @param [String] minutes Only calculate statistics since this many minutes in the
              #   past. The default is 15 minutes.
              # @param [Time] start_date Only calculate statistics from this date and time and
              #   later, specified in {ISO 8601}[https://en.wikipedia.org/wiki/ISO_8601] format.
              # @param [String] task_channel Only calculate cumulative statistics on this
              #   TaskChannel. Can be the TaskChannel's SID or its `unique_name`, such as `voice`,
              #   `sms`, or `default`.
              # @param [String] split_by_wait_time A comma separated list of values that
              #   describes the thresholds, in seconds, to calculate statistics on. For each
              #   threshold specified, the number of Tasks canceled and reservations accepted
              #   above and below the specified thresholds in seconds are computed. TaskRouter
              #   will calculate statistics on up to 10,000 Tasks/Reservations for any given
              #   threshold.
              # @return [TaskQueueCumulativeStatisticsInstance] Fetched TaskQueueCumulativeStatisticsInstance
              def fetch(end_date: :unset, minutes: :unset, start_date: :unset, task_channel: :unset, split_by_wait_time: :unset)
                context.fetch(
                    end_date: end_date,
                    minutes: minutes,
                    start_date: start_date,
                    task_channel: task_channel,
                    split_by_wait_time: split_by_wait_time,
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Taskrouter.V1.TaskQueueCumulativeStatisticsInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Taskrouter.V1.TaskQueueCumulativeStatisticsInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end
