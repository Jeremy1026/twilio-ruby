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
          class ExecutionContext < InstanceContext
            class ExecutionStepContext < InstanceContext
              class ExecutionStepContextList < ListResource
                ##
                # Initialize the ExecutionStepContextList
                # @param [Version] version Version that contains the resource
                # @param [String] flow_sid The SID of the Flow.
                # @param [String] execution_sid The SID of the context's Execution resource.
                # @param [String] step_sid The SID of the Step that the context is associated
                #   with.
                # @return [ExecutionStepContextList] ExecutionStepContextList
                def initialize(version, flow_sid: nil, execution_sid: nil, step_sid: nil)
                  super(version)

                  # Path Solution
                  @solution = {flow_sid: flow_sid, execution_sid: execution_sid, step_sid: step_sid}
                end

                ##
                # Provide a user friendly representation
                def to_s
                  '#<Twilio.Studio.V1.ExecutionStepContextList>'
                end
              end

              class ExecutionStepContextPage < Page
                ##
                # Initialize the ExecutionStepContextPage
                # @param [Version] version Version that contains the resource
                # @param [Response] response Response from the API
                # @param [Hash] solution Path solution for the resource
                # @return [ExecutionStepContextPage] ExecutionStepContextPage
                def initialize(version, response, solution)
                  super(version, response)

                  # Path Solution
                  @solution = solution
                end

                ##
                # Build an instance of ExecutionStepContextInstance
                # @param [Hash] payload Payload response from the API
                # @return [ExecutionStepContextInstance] ExecutionStepContextInstance
                def get_instance(payload)
                  ExecutionStepContextInstance.new(
                      @version,
                      payload,
                      flow_sid: @solution[:flow_sid],
                      execution_sid: @solution[:execution_sid],
                      step_sid: @solution[:step_sid],
                  )
                end

                ##
                # Provide a user friendly representation
                def to_s
                  '<Twilio.Studio.V1.ExecutionStepContextPage>'
                end
              end

              class ExecutionStepContextContext < InstanceContext
                ##
                # Initialize the ExecutionStepContextContext
                # @param [Version] version Version that contains the resource
                # @param [String] flow_sid The SID of the Flow with the Step to fetch.
                # @param [String] execution_sid The SID of the Execution resource with the Step to
                #   fetch.
                # @param [String] step_sid The SID of the Step to fetch.
                # @return [ExecutionStepContextContext] ExecutionStepContextContext
                def initialize(version, flow_sid, execution_sid, step_sid)
                  super(version)

                  # Path Solution
                  @solution = {flow_sid: flow_sid, execution_sid: execution_sid, step_sid: step_sid, }
                  @uri = "/Flows/#{@solution[:flow_sid]}/Executions/#{@solution[:execution_sid]}/Steps/#{@solution[:step_sid]}/Context"
                end

                ##
                # Fetch the ExecutionStepContextInstance
                # @return [ExecutionStepContextInstance] Fetched ExecutionStepContextInstance
                def fetch
                  payload = @version.fetch('GET', @uri)

                  ExecutionStepContextInstance.new(
                      @version,
                      payload,
                      flow_sid: @solution[:flow_sid],
                      execution_sid: @solution[:execution_sid],
                      step_sid: @solution[:step_sid],
                  )
                end

                ##
                # Provide a user friendly representation
                def to_s
                  context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                  "#<Twilio.Studio.V1.ExecutionStepContextContext #{context}>"
                end

                ##
                # Provide a detailed, user friendly representation
                def inspect
                  context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                  "#<Twilio.Studio.V1.ExecutionStepContextContext #{context}>"
                end
              end

              class ExecutionStepContextInstance < InstanceResource
                ##
                # Initialize the ExecutionStepContextInstance
                # @param [Version] version Version that contains the resource
                # @param [Hash] payload payload that contains response from Twilio
                # @param [String] flow_sid The SID of the Flow.
                # @param [String] execution_sid The SID of the context's Execution resource.
                # @param [String] step_sid The SID of the Step that the context is associated
                #   with.
                # @return [ExecutionStepContextInstance] ExecutionStepContextInstance
                def initialize(version, payload, flow_sid: nil, execution_sid: nil, step_sid: nil)
                  super(version)

                  # Marshaled Properties
                  @properties = {
                      'account_sid' => payload['account_sid'],
                      'context' => payload['context'],
                      'execution_sid' => payload['execution_sid'],
                      'flow_sid' => payload['flow_sid'],
                      'step_sid' => payload['step_sid'],
                      'url' => payload['url'],
                  }

                  # Context
                  @instance_context = nil
                  @params = {'flow_sid' => flow_sid, 'execution_sid' => execution_sid, 'step_sid' => step_sid, }
                end

                ##
                # Generate an instance context for the instance, the context is capable of
                # performing various actions.  All instance actions are proxied to the context
                # @return [ExecutionStepContextContext] ExecutionStepContextContext for this ExecutionStepContextInstance
                def context
                  unless @instance_context
                    @instance_context = ExecutionStepContextContext.new(
                        @version,
                        @params['flow_sid'],
                        @params['execution_sid'],
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
                # @return [String] The SID of the Execution
                def execution_sid
                  @properties['execution_sid']
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
                # Fetch the ExecutionStepContextInstance
                # @return [ExecutionStepContextInstance] Fetched ExecutionStepContextInstance
                def fetch
                  context.fetch
                end

                ##
                # Provide a user friendly representation
                def to_s
                  values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                  "<Twilio.Studio.V1.ExecutionStepContextInstance #{values}>"
                end

                ##
                # Provide a detailed, user friendly representation
                def inspect
                  values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                  "<Twilio.Studio.V1.ExecutionStepContextInstance #{values}>"
                end
              end
            end
          end
        end
      end
    end
  end
end
