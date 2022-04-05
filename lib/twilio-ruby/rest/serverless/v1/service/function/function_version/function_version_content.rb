##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Textgrid
  module REST
    class Serverless < Domain
      class V1 < Version
        class ServiceContext < InstanceContext
          class FunctionContext < InstanceContext
            class FunctionVersionContext < InstanceContext
              ##
              # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
              class FunctionVersionContentList < ListResource
                ##
                # Initialize the FunctionVersionContentList
                # @param [Version] version Version that contains the resource
                # @param [String] service_sid The SID of the Service that the Function Version
                #   resource is associated with.
                # @param [String] function_sid The SID of the Function that is the parent of the
                #   Function Version.
                # @param [String] sid The unique string that we created to identify the Function
                #   Version resource.
                # @return [FunctionVersionContentList] FunctionVersionContentList
                def initialize(version, service_sid: nil, function_sid: nil, sid: nil)
                  super(version)

                  # Path Solution
                  @solution = {service_sid: service_sid, function_sid: function_sid, sid: sid}
                end

                ##
                # Provide a user friendly representation
                def to_s
                  '#<Twilio.Serverless.V1.FunctionVersionContentList>'
                end
              end

              ##
              # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
              class FunctionVersionContentPage < Page
                ##
                # Initialize the FunctionVersionContentPage
                # @param [Version] version Version that contains the resource
                # @param [Response] response Response from the API
                # @param [Hash] solution Path solution for the resource
                # @return [FunctionVersionContentPage] FunctionVersionContentPage
                def initialize(version, response, solution)
                  super(version, response)

                  # Path Solution
                  @solution = solution
                end

                ##
                # Build an instance of FunctionVersionContentInstance
                # @param [Hash] payload Payload response from the API
                # @return [FunctionVersionContentInstance] FunctionVersionContentInstance
                def get_instance(payload)
                  FunctionVersionContentInstance.new(
                      @version,
                      payload,
                      service_sid: @solution[:service_sid],
                      function_sid: @solution[:function_sid],
                      sid: @solution[:sid],
                  )
                end

                ##
                # Provide a user friendly representation
                def to_s
                  '<Twilio.Serverless.V1.FunctionVersionContentPage>'
                end
              end

              ##
              # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
              class FunctionVersionContentContext < InstanceContext
                ##
                # Initialize the FunctionVersionContentContext
                # @param [Version] version Version that contains the resource
                # @param [String] service_sid The SID of the Service to fetch the Function Version
                #   content from.
                # @param [String] function_sid The SID of the Function that is the parent of the
                #   Function Version content to fetch.
                # @param [String] sid The SID of the Function Version content to fetch.
                # @return [FunctionVersionContentContext] FunctionVersionContentContext
                def initialize(version, service_sid, function_sid, sid)
                  super(version)

                  # Path Solution
                  @solution = {service_sid: service_sid, function_sid: function_sid, sid: sid, }
                  @uri = "/Services/#{@solution[:service_sid]}/Functions/#{@solution[:function_sid]}/Versions/#{@solution[:sid]}/Content"
                end

                ##
                # Fetch the FunctionVersionContentInstance
                # @return [FunctionVersionContentInstance] Fetched FunctionVersionContentInstance
                def fetch
                  payload = @version.fetch('GET', @uri)

                  FunctionVersionContentInstance.new(
                      @version,
                      payload,
                      service_sid: @solution[:service_sid],
                      function_sid: @solution[:function_sid],
                      sid: @solution[:sid],
                  )
                end

                ##
                # Provide a user friendly representation
                def to_s
                  context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                  "#<Twilio.Serverless.V1.FunctionVersionContentContext #{context}>"
                end

                ##
                # Provide a detailed, user friendly representation
                def inspect
                  context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                  "#<Twilio.Serverless.V1.FunctionVersionContentContext #{context}>"
                end
              end

              ##
              # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
              class FunctionVersionContentInstance < InstanceResource
                ##
                # Initialize the FunctionVersionContentInstance
                # @param [Version] version Version that contains the resource
                # @param [Hash] payload payload that contains response from Twilio
                # @param [String] service_sid The SID of the Service that the Function Version
                #   resource is associated with.
                # @param [String] function_sid The SID of the Function that is the parent of the
                #   Function Version.
                # @param [String] sid The unique string that we created to identify the Function
                #   Version resource.
                # @return [FunctionVersionContentInstance] FunctionVersionContentInstance
                def initialize(version, payload, service_sid: nil, function_sid: nil, sid: nil)
                  super(version)

                  # Marshaled Properties
                  @properties = {
                      'sid' => payload['sid'],
                      'account_sid' => payload['account_sid'],
                      'service_sid' => payload['service_sid'],
                      'function_sid' => payload['function_sid'],
                      'content' => payload['content'],
                      'url' => payload['url'],
                  }

                  # Context
                  @instance_context = nil
                  @params = {'service_sid' => service_sid, 'function_sid' => function_sid, 'sid' => sid, }
                end

                ##
                # Generate an instance context for the instance, the context is capable of
                # performing various actions.  All instance actions are proxied to the context
                # @return [FunctionVersionContentContext] FunctionVersionContentContext for this FunctionVersionContentInstance
                def context
                  unless @instance_context
                    @instance_context = FunctionVersionContentContext.new(
                        @version,
                        @params['service_sid'],
                        @params['function_sid'],
                        @params['sid'],
                    )
                  end
                  @instance_context
                end

                ##
                # @return [String] The unique string that identifies the Function Version resource
                def sid
                  @properties['sid']
                end

                ##
                # @return [String] The SID of the Account that created the Function Version resource
                def account_sid
                  @properties['account_sid']
                end

                ##
                # @return [String] The SID of the Service that the Function Version resource is associated with
                def service_sid
                  @properties['service_sid']
                end

                ##
                # @return [String] The SID of the Function that is the parent of the Function Version
                def function_sid
                  @properties['function_sid']
                end

                ##
                # @return [String] The content of the Function Version resource
                def content
                  @properties['content']
                end

                ##
                # @return [String] The url
                def url
                  @properties['url']
                end

                ##
                # Fetch the FunctionVersionContentInstance
                # @return [FunctionVersionContentInstance] Fetched FunctionVersionContentInstance
                def fetch
                  context.fetch
                end

                ##
                # Provide a user friendly representation
                def to_s
                  values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                  "<Twilio.Serverless.V1.FunctionVersionContentInstance #{values}>"
                end

                ##
                # Provide a detailed, user friendly representation
                def inspect
                  values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                  "<Twilio.Serverless.V1.FunctionVersionContentInstance #{values}>"
                end
              end
            end
          end
        end
      end
    end
  end
end
