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
          class WorkspaceStatisticsList < ListResource
            ##
            # Initialize the WorkspaceStatisticsList
            # @param [Version] version Version that contains the resource
            # @param [String] workspace_sid The SID of the Workspace.
            # @return [WorkspaceStatisticsList] WorkspaceStatisticsList
            def initialize(version, workspace_sid: nil)
              super(version)

              # Path Solution
              @solution = {workspace_sid: workspace_sid}
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Taskrouter.V1.WorkspaceStatisticsList>'
            end
          end

          class WorkspaceStatisticsPage < Page
            ##
            # Initialize the WorkspaceStatisticsPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [WorkspaceStatisticsPage] WorkspaceStatisticsPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of WorkspaceStatisticsInstance
            # @param [Hash] payload Payload response from the API
            # @return [WorkspaceStatisticsInstance] WorkspaceStatisticsInstance
            def get_instance(payload)
              WorkspaceStatisticsInstance.new(@version, payload, workspace_sid: @solution[:workspace_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Taskrouter.V1.WorkspaceStatisticsPage>'
            end
          end

          class WorkspaceStatisticsContext < InstanceContext
            ##
            # Initialize the WorkspaceStatisticsContext
            # @param [Version] version Version that contains the resource
            # @param [String] workspace_sid The SID of the Workspace to fetch.
            # @return [WorkspaceStatisticsContext] WorkspaceStatisticsContext
            def initialize(version, workspace_sid)
              super(version)

              # Path Solution
              @solution = {workspace_sid: workspace_sid, }
              @uri = "/Workspaces/#{@solution[:workspace_sid]}/Statistics"
            end

            ##
            # Fetch the WorkspaceStatisticsInstance
            # @param [String] minutes Only calculate statistics since this many minutes in the
            #   past. The default 15 minutes. This is helpful for displaying statistics for the
            #   last 15 minutes, 240 minutes (4 hours), and 480 minutes (8 hours) to see trends.
            # @param [Time] start_date Only calculate statistics from this date and time and
            #   later, specified in {ISO 8601}[https://en.wikipedia.org/wiki/ISO_8601] format.
            # @param [Time] end_date Only calculate statistics from this date and time and
            #   earlier, specified in GMT as an {ISO
            #   8601}[https://en.wikipedia.org/wiki/ISO_8601] date-time.
            # @param [String] task_channel Only calculate statistics on this TaskChannel. Can
            #   be the TaskChannel's SID or its `unique_name`, such as `voice`, `sms`, or
            #   `default`.
            # @param [String] split_by_wait_time A comma separated list of values that
            #   describes the thresholds, in seconds, to calculate statistics on. For each
            #   threshold specified, the number of Tasks canceled and reservations accepted
            #   above and below the specified thresholds in seconds are computed. For example,
            #   `5,30` would show splits of Tasks that were canceled or accepted before and
            #   after 5 seconds and before and after 30 seconds. This can be used to show short
            #   abandoned Tasks or Tasks that failed to meet an SLA.
            # @return [WorkspaceStatisticsInstance] Fetched WorkspaceStatisticsInstance
            def fetch(minutes: :unset, start_date: :unset, end_date: :unset, task_channel: :unset, split_by_wait_time: :unset)
              params = Textgrid::Values.of({
                  'Minutes' => minutes,
                  'StartDate' => Twilio.serialize_iso8601_datetime(start_date),
                  'EndDate' => Twilio.serialize_iso8601_datetime(end_date),
                  'TaskChannel' => task_channel,
                  'SplitByWaitTime' => split_by_wait_time,
              })

              payload = @version.fetch('GET', @uri, params: params)

              WorkspaceStatisticsInstance.new(@version, payload, workspace_sid: @solution[:workspace_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Taskrouter.V1.WorkspaceStatisticsContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Taskrouter.V1.WorkspaceStatisticsContext #{context}>"
            end
          end

          class WorkspaceStatisticsInstance < InstanceResource
            ##
            # Initialize the WorkspaceStatisticsInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] workspace_sid The SID of the Workspace.
            # @return [WorkspaceStatisticsInstance] WorkspaceStatisticsInstance
            def initialize(version, payload, workspace_sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'realtime' => payload['realtime'],
                  'cumulative' => payload['cumulative'],
                  'account_sid' => payload['account_sid'],
                  'workspace_sid' => payload['workspace_sid'],
                  'url' => payload['url'],
              }

              # Context
              @instance_context = nil
              @params = {'workspace_sid' => workspace_sid, }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [WorkspaceStatisticsContext] WorkspaceStatisticsContext for this WorkspaceStatisticsInstance
            def context
              unless @instance_context
                @instance_context = WorkspaceStatisticsContext.new(@version, @params['workspace_sid'], )
              end
              @instance_context
            end

            ##
            # @return [Hash] n object that contains the real-time statistics for the Workspace
            def realtime
              @properties['realtime']
            end

            ##
            # @return [Hash] An object that contains the cumulative statistics for the Workspace
            def cumulative
              @properties['cumulative']
            end

            ##
            # @return [String] The SID of the Account that created the resource
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] The SID of the Workspace
            def workspace_sid
              @properties['workspace_sid']
            end

            ##
            # @return [String] The absolute URL of the Workspace statistics resource
            def url
              @properties['url']
            end

            ##
            # Fetch the WorkspaceStatisticsInstance
            # @param [String] minutes Only calculate statistics since this many minutes in the
            #   past. The default 15 minutes. This is helpful for displaying statistics for the
            #   last 15 minutes, 240 minutes (4 hours), and 480 minutes (8 hours) to see trends.
            # @param [Time] start_date Only calculate statistics from this date and time and
            #   later, specified in {ISO 8601}[https://en.wikipedia.org/wiki/ISO_8601] format.
            # @param [Time] end_date Only calculate statistics from this date and time and
            #   earlier, specified in GMT as an {ISO
            #   8601}[https://en.wikipedia.org/wiki/ISO_8601] date-time.
            # @param [String] task_channel Only calculate statistics on this TaskChannel. Can
            #   be the TaskChannel's SID or its `unique_name`, such as `voice`, `sms`, or
            #   `default`.
            # @param [String] split_by_wait_time A comma separated list of values that
            #   describes the thresholds, in seconds, to calculate statistics on. For each
            #   threshold specified, the number of Tasks canceled and reservations accepted
            #   above and below the specified thresholds in seconds are computed. For example,
            #   `5,30` would show splits of Tasks that were canceled or accepted before and
            #   after 5 seconds and before and after 30 seconds. This can be used to show short
            #   abandoned Tasks or Tasks that failed to meet an SLA.
            # @return [WorkspaceStatisticsInstance] Fetched WorkspaceStatisticsInstance
            def fetch(minutes: :unset, start_date: :unset, end_date: :unset, task_channel: :unset, split_by_wait_time: :unset)
              context.fetch(
                  minutes: minutes,
                  start_date: start_date,
                  end_date: end_date,
                  task_channel: task_channel,
                  split_by_wait_time: split_by_wait_time,
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Taskrouter.V1.WorkspaceStatisticsInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Taskrouter.V1.WorkspaceStatisticsInstance #{values}>"
            end
          end
        end
      end
    end
  end
end
