##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Textgrid
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class CallList < ListResource
            class FeedbackSummaryList < ListResource
              ##
              # Initialize the FeedbackSummaryList
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The SID of the
              #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Call
              #   resource.
              # @return [FeedbackSummaryList] FeedbackSummaryList
              def initialize(version, account_sid: nil)
                super(version)

                # Path Solution
                @solution = {account_sid: account_sid}
                @uri = "/Accounts/#{@solution[:account_sid]}/Calls/FeedbackSummary.json"
              end

              ##
              # Create the FeedbackSummaryInstance
              # @param [Date] start_date Only include feedback given on or after this date.
              #   Format is `YYYY-MM-DD` and specified in UTC.
              # @param [Date] end_date Only include feedback given on or before this date.
              #   Format is `YYYY-MM-DD` and specified in UTC.
              # @param [Boolean] include_subaccounts Whether to also include Feedback resources
              #   from all subaccounts. `true` includes feedback from all subaccounts and `false`,
              #   the default, includes feedback from only the specified account.
              # @param [String] status_callback The URL that we will request when the feedback
              #   summary is complete.
              # @param [String] status_callback_method The HTTP method (`GET` or `POST`) we use
              #   to make the request to the `StatusCallback` URL.
              # @return [FeedbackSummaryInstance] Created FeedbackSummaryInstance
              def create(start_date: nil, end_date: nil, include_subaccounts: :unset, status_callback: :unset, status_callback_method: :unset)
                data = Textgrid::Values.of({
                    'StartDate' => Twilio.serialize_iso8601_date(start_date),
                    'EndDate' => Twilio.serialize_iso8601_date(end_date),
                    'IncludeSubaccounts' => include_subaccounts,
                    'StatusCallback' => status_callback,
                    'StatusCallbackMethod' => status_callback_method,
                })

                payload = @version.create('POST', @uri, data: data)

                FeedbackSummaryInstance.new(@version, payload, account_sid: @solution[:account_sid], )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Api.V2010.FeedbackSummaryList>'
              end
            end

            class FeedbackSummaryPage < Page
              ##
              # Initialize the FeedbackSummaryPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [FeedbackSummaryPage] FeedbackSummaryPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of FeedbackSummaryInstance
              # @param [Hash] payload Payload response from the API
              # @return [FeedbackSummaryInstance] FeedbackSummaryInstance
              def get_instance(payload)
                FeedbackSummaryInstance.new(@version, payload, account_sid: @solution[:account_sid], )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Api.V2010.FeedbackSummaryPage>'
              end
            end

            class FeedbackSummaryContext < InstanceContext
              ##
              # Initialize the FeedbackSummaryContext
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The unique id of the
              #   {Account}[https://www.twilio.com/docs/iam/api/account] responsible for this
              #   resource.
              # @param [String] sid A 34 character string that uniquely identifies this
              #   resource.
              # @return [FeedbackSummaryContext] FeedbackSummaryContext
              def initialize(version, account_sid, sid)
                super(version)

                # Path Solution
                @solution = {account_sid: account_sid, sid: sid, }
                @uri = "/Accounts/#{@solution[:account_sid]}/Calls/FeedbackSummary/#{@solution[:sid]}.json"
              end

              ##
              # Fetch the FeedbackSummaryInstance
              # @return [FeedbackSummaryInstance] Fetched FeedbackSummaryInstance
              def fetch
                payload = @version.fetch('GET', @uri)

                FeedbackSummaryInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Delete the FeedbackSummaryInstance
              # @return [Boolean] true if delete succeeds, false otherwise
              def delete
                 @version.delete('DELETE', @uri)
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Api.V2010.FeedbackSummaryContext #{context}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Api.V2010.FeedbackSummaryContext #{context}>"
              end
            end

            class FeedbackSummaryInstance < InstanceResource
              ##
              # Initialize the FeedbackSummaryInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] account_sid The SID of the
              #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Call
              #   resource.
              # @param [String] sid A 34 character string that uniquely identifies this
              #   resource.
              # @return [FeedbackSummaryInstance] FeedbackSummaryInstance
              def initialize(version, payload, account_sid: nil, sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'call_count' => payload['call_count'].to_i,
                    'call_feedback_count' => payload['call_feedback_count'].to_i,
                    'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                    'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                    'end_date' => Twilio.deserialize_iso8601_date(payload['end_date']),
                    'include_subaccounts' => payload['include_subaccounts'],
                    'issues' => payload['issues'],
                    'quality_score_average' => payload['quality_score_average'].to_f,
                    'quality_score_median' => payload['quality_score_median'].to_f,
                    'quality_score_standard_deviation' => payload['quality_score_standard_deviation'].to_f,
                    'sid' => payload['sid'],
                    'start_date' => Twilio.deserialize_iso8601_date(payload['start_date']),
                    'status' => payload['status'],
                }

                # Context
                @instance_context = nil
                @params = {'account_sid' => account_sid, 'sid' => sid || @properties['sid'], }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [FeedbackSummaryContext] FeedbackSummaryContext for this FeedbackSummaryInstance
              def context
                unless @instance_context
                  @instance_context = FeedbackSummaryContext.new(@version, @params['account_sid'], @params['sid'], )
                end
                @instance_context
              end

              ##
              # @return [String] The unique sid that identifies this account
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] The total number of calls
              def call_count
                @properties['call_count']
              end

              ##
              # @return [String] The total number of calls with a feedback entry
              def call_feedback_count
                @properties['call_feedback_count']
              end

              ##
              # @return [Time] The date this resource was created
              def date_created
                @properties['date_created']
              end

              ##
              # @return [Time] The date this resource was last updated
              def date_updated
                @properties['date_updated']
              end

              ##
              # @return [Date] The latest feedback entry date in the summary
              def end_date
                @properties['end_date']
              end

              ##
              # @return [Boolean] Whether the feedback summary includes subaccounts
              def include_subaccounts
                @properties['include_subaccounts']
              end

              ##
              # @return [Array[Hash]] Issues experienced during the call
              def issues
                @properties['issues']
              end

              ##
              # @return [String] The average QualityScore of the feedback entries
              def quality_score_average
                @properties['quality_score_average']
              end

              ##
              # @return [String] The median QualityScore of the feedback entries
              def quality_score_median
                @properties['quality_score_median']
              end

              ##
              # @return [String] The standard deviation of the quality scores
              def quality_score_standard_deviation
                @properties['quality_score_standard_deviation']
              end

              ##
              # @return [String] A string that uniquely identifies this feedback entry
              def sid
                @properties['sid']
              end

              ##
              # @return [Date] The earliest feedback entry date in the summary
              def start_date
                @properties['start_date']
              end

              ##
              # @return [feedback_summary.Status] The status of the feedback summary
              def status
                @properties['status']
              end

              ##
              # Fetch the FeedbackSummaryInstance
              # @return [FeedbackSummaryInstance] Fetched FeedbackSummaryInstance
              def fetch
                context.fetch
              end

              ##
              # Delete the FeedbackSummaryInstance
              # @return [Boolean] true if delete succeeds, false otherwise
              def delete
                context.delete
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Api.V2010.FeedbackSummaryInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Api.V2010.FeedbackSummaryInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end
