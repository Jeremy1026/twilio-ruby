##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Textgrid
  module REST
    class Studio < Domain
      class V1 < Version
        class FlowContext < InstanceContext
          class EngagementContext < InstanceContext
            class StepContext < InstanceContext
              class StepContextList < ListResource
                ##
                # Initialize the StepContextList
                # @param [Version] version Version that contains the resource
                # @param [String] flow_sid The SID of the Flow.
                # @param [String] engagement_sid The SID of the Engagement.
                # @param [String] step_sid The SID of the Step the context is associated with.
                # @return [StepContextList] StepContextList
                def initialize(version, flow_sid: nil, engagement_sid: nil, step_sid: nil)
                  super(version)

                  # Path Solution
                  @solution = {flow_sid: flow_sid, engagement_sid: engagement_sid, step_sid: step_sid}
                end

                ##
                # Provide a user friendly representation
                def to_s
                  '#<Twilio.Studio.V1.StepContextList>'
                end
              end

              class StepContextPage < Page
                ##
                # Initialize the StepContextPage
                # @param [Version] version Version that contains the resource
                # @param [Response] response Response from the API
                # @param [Hash] solution Path solution for the resource
                # @return [StepContextPage] StepContextPage
                def initialize(version, response, solution)
                  super(version, response)

                  # Path Solution
                  @solution = solution
                end

                ##
                # Build an instance of StepContextInstance
                # @param [Hash] payload Payload response from the API
                # @return [StepContextInstance] StepContextInstance
                def get_instance(payload)
                  StepContextInstance.new(
                      @version,
                      payload,
                      flow_sid: @solution[:flow_sid],
                      engagement_sid: @solution[:engagement_sid],
                      step_sid: @solution[:step_sid],
                  )
                end

                ##
                # Provide a user friendly representation
                def to_s
                  '<Twilio.Studio.V1.StepContextPage>'
                end
              end

              class StepContextContext < InstanceContext
                ##
                # Initialize the StepContextContext
                # @param [Version] version Version that contains the resource
                # @param [String] flow_sid The SID of the Flow with the Step to fetch.
                # @param [String] engagement_sid The SID of the Engagement with the Step to fetch.
                # @param [String] step_sid The SID of the Step to fetch
                # @return [StepContextContext] StepContextContext
                def initialize(version, flow_sid, engagement_sid, step_sid)
                  super(version)

                  # Path Solution
                  @solution = {flow_sid: flow_sid, engagement_sid: engagement_sid, step_sid: step_sid, }
                  @uri = "/Flows/#{@solution[:flow_sid]}/Engagements/#{@solution[:engagement_sid]}/Steps/#{@solution[:step_sid]}/Context"
                end

                ##
                # Fetch the StepContextInstance
                # @return [StepContextInstance] Fetched StepContextInstance
                def fetch
                  payload = @version.fetch('GET', @uri)

                  StepContextInstance.new(
                      @version,
                      payload,
                      flow_sid: @solution[:flow_sid],
                      engagement_sid: @solution[:engagement_sid],
                      step_sid: @solution[:step_sid],
                  )
                end

                ##
                # Provide a user friendly representation
                def to_s
                  context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                  "#<Twilio.Studio.V1.StepContextContext #{context}>"
                end

                ##
                # Provide a detailed, user friendly representation
                def inspect
                  context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                  "#<Twilio.Studio.V1.StepContextContext #{context}>"
                end
              end

              class StepContextInstance < InstanceResource
                ##
                # Initialize the StepContextInstance
                # @param [Version] version Version that contains the resource
                # @param [Hash] payload payload that contains response from Twilio
                # @param [String] flow_sid The SID of the Flow.
                # @param [String] engagement_sid The SID of the Engagement.
                # @param [String] step_sid The SID of the Step the context is associated with.
                # @return [StepContextInstance] StepContextInstance
                def initialize(version, payload, flow_sid: nil, engagement_sid: nil, step_sid: nil)
                  super(version)

                  # Marshaled Properties
                  @properties = {
                      'account_sid' => payload['account_sid'],
                      'context' => payload['context'],
                      'engagement_sid' => payload['engagement_sid'],
                      'flow_sid' => payload['flow_sid'],
                      'step_sid' => payload['step_sid'],
                      'url' => payload['url'],
                  }

                  # Context
                  @instance_context = nil
                  @params = {'flow_sid' => flow_sid, 'engagement_sid' => engagement_sid, 'step_sid' => step_sid, }
                end

                ##
                # Generate an instance context for the instance, the context is capable of
                # performing various actions.  All instance actions are proxied to the context
                # @return [StepContextContext] StepContextContext for this StepContextInstance
                def context
                  unless @instance_context
                    @instance_context = StepContextContext.new(
                        @version,
                        @params['flow_sid'],
                        @params['engagement_sid'],
                        @params['step_sid'],
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
                # @return [Hash] The current state of the flow
                def context
                  @properties['context']
                end

                ##
                # @return [String] The SID of the Engagement
                def engagement_sid
                  @properties['engagement_sid']
                end

                ##
                # @return [String] The SID of the Flow
                def flow_sid
                  @properties['flow_sid']
                end

                ##
                # @return [String] Step SID
                def step_sid
                  @properties['step_sid']
                end

                ##
                # @return [String] The absolute URL of the resource
                def url
                  @properties['url']
                end

                ##
                # Fetch the StepContextInstance
                # @return [StepContextInstance] Fetched StepContextInstance
                def fetch
                  context.fetch
                end

                ##
                # Provide a user friendly representation
                def to_s
                  values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                  "<Twilio.Studio.V1.StepContextInstance #{values}>"
                end

                ##
                # Provide a detailed, user friendly representation
                def inspect
                  values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                  "<Twilio.Studio.V1.StepContextInstance #{values}>"
                end
              end
            end
          end
        end
      end
    end
  end
end
