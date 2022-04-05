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
          class EnvironmentContext < InstanceContext
            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class LogList < ListResource
              ##
              # Initialize the LogList
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The SID of the Service that the Log resource is
              #   associated with.
              # @param [String] environment_sid The SID of the environment in which the log
              #   occurred.
              # @return [LogList] LogList
              def initialize(version, service_sid: nil, environment_sid: nil)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, environment_sid: environment_sid}
                @uri = "/Services/#{@solution[:service_sid]}/Environments/#{@solution[:environment_sid]}/Logs"
              end

              ##
              # Lists LogInstance records from the API as a list.
              # Unlike stream(), this operation is eager and will load `limit` records into
              # memory before returning.
              # @param [String] function_sid The SID of the function whose invocation produced
              #   the Log resources to read.
              # @param [Time] start_date The date/time (in GMT, ISO 8601) after which the Log
              #   resources must have been created. Defaults to 1 day prior to current date/time.
              # @param [Time] end_date The date/time (in GMT, ISO 8601) before which the Log
              #   resources must have been created. Defaults to current date/time.
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit.  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records.  If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Array] Array of up to limit results
              def list(function_sid: :unset, start_date: :unset, end_date: :unset, limit: nil, page_size: nil)
                self.stream(
                    function_sid: function_sid,
                    start_date: start_date,
                    end_date: end_date,
                    limit: limit,
                    page_size: page_size
                ).entries
              end

              ##
              # Streams LogInstance records from the API as an Enumerable.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [String] function_sid The SID of the function whose invocation produced
              #   the Log resources to read.
              # @param [Time] start_date The date/time (in GMT, ISO 8601) after which the Log
              #   resources must have been created. Defaults to 1 day prior to current date/time.
              # @param [Time] end_date The date/time (in GMT, ISO 8601) before which the Log
              #   resources must have been created. Defaults to current date/time.
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit. Default is no limit.
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records. If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Enumerable] Enumerable that will yield up to limit results
              def stream(function_sid: :unset, start_date: :unset, end_date: :unset, limit: nil, page_size: nil)
                limits = @version.read_limits(limit, page_size)

                page = self.page(
                    function_sid: function_sid,
                    start_date: start_date,
                    end_date: end_date,
                    page_size: limits[:page_size],
                )

                @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
              end

              ##
              # When passed a block, yields LogInstance records from the API.
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
              # Retrieve a single page of LogInstance records from the API.
              # Request is executed immediately.
              # @param [String] function_sid The SID of the function whose invocation produced
              #   the Log resources to read.
              # @param [Time] start_date The date/time (in GMT, ISO 8601) after which the Log
              #   resources must have been created. Defaults to 1 day prior to current date/time.
              # @param [Time] end_date The date/time (in GMT, ISO 8601) before which the Log
              #   resources must have been created. Defaults to current date/time.
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of LogInstance
              def page(function_sid: :unset, start_date: :unset, end_date: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                params = Textgrid::Values.of({
                    'FunctionSid' => function_sid,
                    'StartDate' => Twilio.serialize_iso8601_datetime(start_date),
                    'EndDate' => Twilio.serialize_iso8601_datetime(end_date),
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                })

                response = @version.page('GET', @uri, params: params)

                LogPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of LogInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of LogInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                LogPage.new(@version, response, @solution)
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Serverless.V1.LogList>'
              end
            end

            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class LogPage < Page
              ##
              # Initialize the LogPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [LogPage] LogPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of LogInstance
              # @param [Hash] payload Payload response from the API
              # @return [LogInstance] LogInstance
              def get_instance(payload)
                LogInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    environment_sid: @solution[:environment_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Serverless.V1.LogPage>'
              end
            end

            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class LogContext < InstanceContext
              ##
              # Initialize the LogContext
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The SID of the Service to fetch the Log resource
              #   from.
              # @param [String] environment_sid The SID of the environment with the Log resource
              #   to fetch.
              # @param [String] sid The SID of the Log resource to fetch.
              # @return [LogContext] LogContext
              def initialize(version, service_sid, environment_sid, sid)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, environment_sid: environment_sid, sid: sid, }
                @uri = "/Services/#{@solution[:service_sid]}/Environments/#{@solution[:environment_sid]}/Logs/#{@solution[:sid]}"
              end

              ##
              # Fetch the LogInstance
              # @return [LogInstance] Fetched LogInstance
              def fetch
                payload = @version.fetch('GET', @uri)

                LogInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    environment_sid: @solution[:environment_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Serverless.V1.LogContext #{context}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Serverless.V1.LogContext #{context}>"
              end
            end

            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class LogInstance < InstanceResource
              ##
              # Initialize the LogInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] service_sid The SID of the Service that the Log resource is
              #   associated with.
              # @param [String] environment_sid The SID of the environment in which the log
              #   occurred.
              # @param [String] sid The SID of the Log resource to fetch.
              # @return [LogInstance] LogInstance
              def initialize(version, payload, service_sid: nil, environment_sid: nil, sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'sid' => payload['sid'],
                    'account_sid' => payload['account_sid'],
                    'service_sid' => payload['service_sid'],
                    'environment_sid' => payload['environment_sid'],
                    'build_sid' => payload['build_sid'],
                    'deployment_sid' => payload['deployment_sid'],
                    'function_sid' => payload['function_sid'],
                    'request_sid' => payload['request_sid'],
                    'level' => payload['level'],
                    'message' => payload['message'],
                    'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                    'url' => payload['url'],
                }

                # Context
                @instance_context = nil
                @params = {
                    'service_sid' => service_sid,
                    'environment_sid' => environment_sid,
                    'sid' => sid || @properties['sid'],
                }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [LogContext] LogContext for this LogInstance
              def context
                unless @instance_context
                  @instance_context = LogContext.new(
                      @version,
                      @params['service_sid'],
                      @params['environment_sid'],
                      @params['sid'],
                  )
                end
                @instance_context
              end

              ##
              # @return [String] The unique string that identifies the Log resource
              def sid
                @properties['sid']
              end

              ##
              # @return [String] The SID of the Account that created the Log resource
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] The SID of the Service that the Log resource is associated with
              def service_sid
                @properties['service_sid']
              end

              ##
              # @return [String] The SID of the environment in which the log occurred
              def environment_sid
                @properties['environment_sid']
              end

              ##
              # @return [String] The SID of the build that corresponds to the log
              def build_sid
                @properties['build_sid']
              end

              ##
              # @return [String] The SID of the deployment that corresponds to the log
              def deployment_sid
                @properties['deployment_sid']
              end

              ##
              # @return [String] The SID of the function whose invocation produced the log
              def function_sid
                @properties['function_sid']
              end

              ##
              # @return [String] The SID of the request associated with the log
              def request_sid
                @properties['request_sid']
              end

              ##
              # @return [log.Level] The log level
              def level
                @properties['level']
              end

              ##
              # @return [String] The log message
              def message
                @properties['message']
              end

              ##
              # @return [Time] The ISO 8601 date and time in GMT when the Log resource was created
              def date_created
                @properties['date_created']
              end

              ##
              # @return [String] The absolute URL of the Log resource
              def url
                @properties['url']
              end

              ##
              # Fetch the LogInstance
              # @return [LogInstance] Fetched LogInstance
              def fetch
                context.fetch
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Serverless.V1.LogInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Serverless.V1.LogInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end
