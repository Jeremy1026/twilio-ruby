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
          class BuildContext < InstanceContext
            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class BuildStatusList < ListResource
              ##
              # Initialize the BuildStatusList
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The SID of the Service that the Build resource is
              #   associated with.
              # @param [String] sid The unique string that we created to identify the Build
              #   resource.
              # @return [BuildStatusList] BuildStatusList
              def initialize(version, service_sid: nil, sid: nil)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, sid: sid}
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Serverless.V1.BuildStatusList>'
              end
            end

            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class BuildStatusPage < Page
              ##
              # Initialize the BuildStatusPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [BuildStatusPage] BuildStatusPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of BuildStatusInstance
              # @param [Hash] payload Payload response from the API
              # @return [BuildStatusInstance] BuildStatusInstance
              def get_instance(payload)
                BuildStatusInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Serverless.V1.BuildStatusPage>'
              end
            end

            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class BuildStatusContext < InstanceContext
              ##
              # Initialize the BuildStatusContext
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The SID of the Service to fetch the Build resource
              #   from.
              # @param [String] sid The SID of the Build resource to fetch.
              # @return [BuildStatusContext] BuildStatusContext
              def initialize(version, service_sid, sid)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, sid: sid, }
                @uri = "/Services/#{@solution[:service_sid]}/Builds/#{@solution[:sid]}/Status"
              end

              ##
              # Fetch the BuildStatusInstance
              # @return [BuildStatusInstance] Fetched BuildStatusInstance
              def fetch
                payload = @version.fetch('GET', @uri)

                BuildStatusInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Serverless.V1.BuildStatusContext #{context}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Serverless.V1.BuildStatusContext #{context}>"
              end
            end

            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class BuildStatusInstance < InstanceResource
              ##
              # Initialize the BuildStatusInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] service_sid The SID of the Service that the Build resource is
              #   associated with.
              # @param [String] sid The unique string that we created to identify the Build
              #   resource.
              # @return [BuildStatusInstance] BuildStatusInstance
              def initialize(version, payload, service_sid: nil, sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'sid' => payload['sid'],
                    'account_sid' => payload['account_sid'],
                    'service_sid' => payload['service_sid'],
                    'status' => payload['status'],
                    'url' => payload['url'],
                }

                # Context
                @instance_context = nil
                @params = {'service_sid' => service_sid, 'sid' => sid, }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [BuildStatusContext] BuildStatusContext for this BuildStatusInstance
              def context
                unless @instance_context
                  @instance_context = BuildStatusContext.new(@version, @params['service_sid'], @params['sid'], )
                end
                @instance_context
              end

              ##
              # @return [String] The unique string that identifies the Build resource
              def sid
                @properties['sid']
              end

              ##
              # @return [String] The SID of the Account that created the Build resource
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] The SID of the Service that the Build resource is associated with
              def service_sid
                @properties['service_sid']
              end

              ##
              # @return [build_status.Status] The status of the Build
              def status
                @properties['status']
              end

              ##
              # @return [String] The absolute URL of the Build Status resource
              def url
                @properties['url']
              end

              ##
              # Fetch the BuildStatusInstance
              # @return [BuildStatusInstance] Fetched BuildStatusInstance
              def fetch
                context.fetch
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Serverless.V1.BuildStatusInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Serverless.V1.BuildStatusInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end
