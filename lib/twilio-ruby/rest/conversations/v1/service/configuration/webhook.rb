##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Textgrid
  module REST
    class Conversations < Domain
      class V1 < Version
        class ServiceContext < InstanceContext
          class ConfigurationContext < InstanceContext
            class WebhookList < ListResource
              ##
              # Initialize the WebhookList
              # @param [Version] version Version that contains the resource
              # @param [String] chat_service_sid The unique string that we created to identify
              #   the Service configuration resource.
              # @return [WebhookList] WebhookList
              def initialize(version, chat_service_sid: nil)
                super(version)

                # Path Solution
                @solution = {chat_service_sid: chat_service_sid}
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Conversations.V1.WebhookList>'
              end
            end

            class WebhookPage < Page
              ##
              # Initialize the WebhookPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [WebhookPage] WebhookPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of WebhookInstance
              # @param [Hash] payload Payload response from the API
              # @return [WebhookInstance] WebhookInstance
              def get_instance(payload)
                WebhookInstance.new(@version, payload, chat_service_sid: @solution[:chat_service_sid], )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Conversations.V1.WebhookPage>'
              end
            end

            class WebhookContext < InstanceContext
              ##
              # Initialize the WebhookContext
              # @param [Version] version Version that contains the resource
              # @param [String] chat_service_sid The unique ID of the {Conversation
              #   Service}[https://www.twilio.com/docs/conversations/api/service-resource] this
              #   conversation belongs to.
              # @return [WebhookContext] WebhookContext
              def initialize(version, chat_service_sid)
                super(version)

                # Path Solution
                @solution = {chat_service_sid: chat_service_sid, }
                @uri = "/Services/#{@solution[:chat_service_sid]}/Configuration/Webhooks"
              end

              ##
              # Update the WebhookInstance
              # @param [String] pre_webhook_url The absolute url the pre-event webhook request
              #   should be sent to.
              # @param [String] post_webhook_url The absolute url the post-event webhook request
              #   should be sent to.
              # @param [Array[String]] filters The list of events that your configured webhook
              #   targets will receive. Events not configured here will not fire. Possible values
              #   are `onParticipantAdd`, `onParticipantAdded`, `onDeliveryUpdated`,
              #   `onConversationUpdated`, `onConversationRemove`, `onParticipantRemove`,
              #   `onConversationUpdate`, `onMessageAdd`, `onMessageRemoved`,
              #   `onParticipantUpdated`, `onConversationAdded`, `onMessageAdded`,
              #   `onConversationAdd`, `onConversationRemoved`, `onParticipantUpdate`,
              #   `onMessageRemove`, `onMessageUpdated`, `onParticipantRemoved`, `onMessageUpdate`
              #   or `onConversationStateUpdated`.
              # @param [String] method The HTTP method to be used when sending a webhook
              #   request. One of `GET` or `POST`.
              # @return [WebhookInstance] Updated WebhookInstance
              def update(pre_webhook_url: :unset, post_webhook_url: :unset, filters: :unset, method: :unset)
                data = Textgrid::Values.of({
                    'PreWebhookUrl' => pre_webhook_url,
                    'PostWebhookUrl' => post_webhook_url,
                    'Filters' => Twilio.serialize_list(filters) { |e| e },
                    'Method' => method,
                })

                payload = @version.update('POST', @uri, data: data)

                WebhookInstance.new(@version, payload, chat_service_sid: @solution[:chat_service_sid], )
              end

              ##
              # Fetch the WebhookInstance
              # @return [WebhookInstance] Fetched WebhookInstance
              def fetch
                payload = @version.fetch('GET', @uri)

                WebhookInstance.new(@version, payload, chat_service_sid: @solution[:chat_service_sid], )
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Conversations.V1.WebhookContext #{context}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Conversations.V1.WebhookContext #{context}>"
              end
            end

            class WebhookInstance < InstanceResource
              ##
              # Initialize the WebhookInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] chat_service_sid The unique string that we created to identify
              #   the Service configuration resource.
              # @return [WebhookInstance] WebhookInstance
              def initialize(version, payload, chat_service_sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'chat_service_sid' => payload['chat_service_sid'],
                    'pre_webhook_url' => payload['pre_webhook_url'],
                    'post_webhook_url' => payload['post_webhook_url'],
                    'filters' => payload['filters'],
                    'method' => payload['method'],
                    'url' => payload['url'],
                }

                # Context
                @instance_context = nil
                @params = {'chat_service_sid' => chat_service_sid, }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [WebhookContext] WebhookContext for this WebhookInstance
              def context
                unless @instance_context
                  @instance_context = WebhookContext.new(@version, @params['chat_service_sid'], )
                end
                @instance_context
              end

              ##
              # @return [String] The unique ID of the Account responsible for this service.
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] The unique ID of the {Conversation Service}[https://www.twilio.com/docs/conversations/api/service-resource] this conversation belongs to.
              def chat_service_sid
                @properties['chat_service_sid']
              end

              ##
              # @return [String] The absolute url the pre-event webhook request should be sent to.
              def pre_webhook_url
                @properties['pre_webhook_url']
              end

              ##
              # @return [String] The absolute url the post-event webhook request should be sent to.
              def post_webhook_url
                @properties['post_webhook_url']
              end

              ##
              # @return [Array[String]] The list of events that your configured webhook targets will receive. Events not configured here will not fire.
              def filters
                @properties['filters']
              end

              ##
              # @return [webhook.Method] The HTTP method to be used when sending a webhook request
              def method
                @properties['method']
              end

              ##
              # @return [String] An absolute URL for this webhook.
              def url
                @properties['url']
              end

              ##
              # Update the WebhookInstance
              # @param [String] pre_webhook_url The absolute url the pre-event webhook request
              #   should be sent to.
              # @param [String] post_webhook_url The absolute url the post-event webhook request
              #   should be sent to.
              # @param [Array[String]] filters The list of events that your configured webhook
              #   targets will receive. Events not configured here will not fire. Possible values
              #   are `onParticipantAdd`, `onParticipantAdded`, `onDeliveryUpdated`,
              #   `onConversationUpdated`, `onConversationRemove`, `onParticipantRemove`,
              #   `onConversationUpdate`, `onMessageAdd`, `onMessageRemoved`,
              #   `onParticipantUpdated`, `onConversationAdded`, `onMessageAdded`,
              #   `onConversationAdd`, `onConversationRemoved`, `onParticipantUpdate`,
              #   `onMessageRemove`, `onMessageUpdated`, `onParticipantRemoved`, `onMessageUpdate`
              #   or `onConversationStateUpdated`.
              # @param [String] method The HTTP method to be used when sending a webhook
              #   request. One of `GET` or `POST`.
              # @return [WebhookInstance] Updated WebhookInstance
              def update(pre_webhook_url: :unset, post_webhook_url: :unset, filters: :unset, method: :unset)
                context.update(
                    pre_webhook_url: pre_webhook_url,
                    post_webhook_url: post_webhook_url,
                    filters: filters,
                    method: method,
                )
              end

              ##
              # Fetch the WebhookInstance
              # @return [WebhookInstance] Fetched WebhookInstance
              def fetch
                context.fetch
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Conversations.V1.WebhookInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Conversations.V1.WebhookInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end
