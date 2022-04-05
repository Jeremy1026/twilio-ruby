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
        class ConversationContext < InstanceContext
          class MessageList < ListResource
            ##
            # Initialize the MessageList
            # @param [Version] version Version that contains the resource
            # @param [String] conversation_sid The unique ID of the
            #   {Conversation}[https://www.twilio.com/docs/conversations/api/conversation-resource]
            #   for this message.
            # @return [MessageList] MessageList
            def initialize(version, conversation_sid: nil)
              super(version)

              # Path Solution
              @solution = {conversation_sid: conversation_sid}
              @uri = "/Conversations/#{@solution[:conversation_sid]}/Messages"
            end

            ##
            # Create the MessageInstance
            # @param [String] author The channel specific identifier of the message's author.
            #   Defaults to `system`.
            # @param [String] body The content of the message, can be up to 1,600 characters
            #   long.
            # @param [Time] date_created The date that this resource was created.
            # @param [Time] date_updated The date that this resource was last updated. `null`
            #   if the message has not been edited.
            # @param [String] attributes A string metadata field you can use to store any data
            #   you wish. The string value must contain structurally valid JSON if specified.
            #   **Note** that if the attributes are not set "{}" will be returned.
            # @param [String] media_sid The Media SID to be attached to the new Message.
            # @param [message.WebhookEnabledType] x_twilio_webhook_enabled The
            #   X-Twilio-Webhook-Enabled HTTP request header
            # @return [MessageInstance] Created MessageInstance
            def create(author: :unset, body: :unset, date_created: :unset, date_updated: :unset, attributes: :unset, media_sid: :unset, x_twilio_webhook_enabled: :unset)
              data = Textgrid::Values.of({
                  'Author' => author,
                  'Body' => body,
                  'DateCreated' => Twilio.serialize_iso8601_datetime(date_created),
                  'DateUpdated' => Twilio.serialize_iso8601_datetime(date_updated),
                  'Attributes' => attributes,
                  'MediaSid' => media_sid,
              })
              headers = Textgrid::Values.of({'X-Twilio-Webhook-Enabled' => x_twilio_webhook_enabled, })

              payload = @version.create('POST', @uri, data: data, headers: headers)

              MessageInstance.new(@version, payload, conversation_sid: @solution[:conversation_sid], )
            end

            ##
            # Lists MessageInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [message.OrderType] order The sort order of the returned messages. Can
            #   be: `asc` (ascending) or `desc` (descending), with `asc` as the default.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(order: :unset, limit: nil, page_size: nil)
              self.stream(order: order, limit: limit, page_size: page_size).entries
            end

            ##
            # Streams MessageInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [message.OrderType] order The sort order of the returned messages. Can
            #   be: `asc` (ascending) or `desc` (descending), with `asc` as the default.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(order: :unset, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(order: order, page_size: limits[:page_size], )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields MessageInstance records from the API.
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
            # Retrieve a single page of MessageInstance records from the API.
            # Request is executed immediately.
            # @param [message.OrderType] order The sort order of the returned messages. Can
            #   be: `asc` (ascending) or `desc` (descending), with `asc` as the default.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of MessageInstance
            def page(order: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
              params = Textgrid::Values.of({
                  'Order' => order,
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })

              response = @version.page('GET', @uri, params: params)

              MessagePage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of MessageInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of MessageInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              MessagePage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Conversations.V1.MessageList>'
            end
          end

          class MessagePage < Page
            ##
            # Initialize the MessagePage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [MessagePage] MessagePage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of MessageInstance
            # @param [Hash] payload Payload response from the API
            # @return [MessageInstance] MessageInstance
            def get_instance(payload)
              MessageInstance.new(@version, payload, conversation_sid: @solution[:conversation_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Conversations.V1.MessagePage>'
            end
          end

          class MessageContext < InstanceContext
            ##
            # Initialize the MessageContext
            # @param [Version] version Version that contains the resource
            # @param [String] conversation_sid The unique ID of the
            #   {Conversation}[https://www.twilio.com/docs/conversations/api/conversation-resource]
            #   for this message.
            # @param [String] sid A 34 character string that uniquely identifies this
            #   resource.
            # @return [MessageContext] MessageContext
            def initialize(version, conversation_sid, sid)
              super(version)

              # Path Solution
              @solution = {conversation_sid: conversation_sid, sid: sid, }
              @uri = "/Conversations/#{@solution[:conversation_sid]}/Messages/#{@solution[:sid]}"

              # Dependents
              @delivery_receipts = nil
            end

            ##
            # Update the MessageInstance
            # @param [String] author The channel specific identifier of the message's author.
            #   Defaults to `system`.
            # @param [String] body The content of the message, can be up to 1,600 characters
            #   long.
            # @param [Time] date_created The date that this resource was created.
            # @param [Time] date_updated The date that this resource was last updated. `null`
            #   if the message has not been edited.
            # @param [String] attributes A string metadata field you can use to store any data
            #   you wish. The string value must contain structurally valid JSON if specified.
            #   **Note** that if the attributes are not set "{}" will be returned.
            # @param [message.WebhookEnabledType] x_twilio_webhook_enabled The
            #   X-Twilio-Webhook-Enabled HTTP request header
            # @return [MessageInstance] Updated MessageInstance
            def update(author: :unset, body: :unset, date_created: :unset, date_updated: :unset, attributes: :unset, x_twilio_webhook_enabled: :unset)
              data = Textgrid::Values.of({
                  'Author' => author,
                  'Body' => body,
                  'DateCreated' => Twilio.serialize_iso8601_datetime(date_created),
                  'DateUpdated' => Twilio.serialize_iso8601_datetime(date_updated),
                  'Attributes' => attributes,
              })
              headers = Textgrid::Values.of({'X-Twilio-Webhook-Enabled' => x_twilio_webhook_enabled, })

              payload = @version.update('POST', @uri, data: data, headers: headers)

              MessageInstance.new(
                  @version,
                  payload,
                  conversation_sid: @solution[:conversation_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Delete the MessageInstance
            # @param [message.WebhookEnabledType] x_twilio_webhook_enabled The
            #   X-Twilio-Webhook-Enabled HTTP request header
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete(x_twilio_webhook_enabled: :unset)
              headers = Textgrid::Values.of({'X-Twilio-Webhook-Enabled' => x_twilio_webhook_enabled, })

               @version.delete('DELETE', @uri, headers: headers)
            end

            ##
            # Fetch the MessageInstance
            # @return [MessageInstance] Fetched MessageInstance
            def fetch
              payload = @version.fetch('GET', @uri)

              MessageInstance.new(
                  @version,
                  payload,
                  conversation_sid: @solution[:conversation_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Access the delivery_receipts
            # @return [DeliveryReceiptList]
            # @return [DeliveryReceiptContext] if sid was passed.
            def delivery_receipts(sid=:unset)
              raise ArgumentError, 'sid cannot be nil' if sid.nil?

              if sid != :unset
                return DeliveryReceiptContext.new(@version, @solution[:conversation_sid], @solution[:sid], sid, )
              end

              unless @delivery_receipts
                @delivery_receipts = DeliveryReceiptList.new(
                    @version,
                    conversation_sid: @solution[:conversation_sid],
                    message_sid: @solution[:sid],
                )
              end

              @delivery_receipts
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Conversations.V1.MessageContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Conversations.V1.MessageContext #{context}>"
            end
          end

          class MessageInstance < InstanceResource
            ##
            # Initialize the MessageInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] conversation_sid The unique ID of the
            #   {Conversation}[https://www.twilio.com/docs/conversations/api/conversation-resource]
            #   for this message.
            # @param [String] sid A 34 character string that uniquely identifies this
            #   resource.
            # @return [MessageInstance] MessageInstance
            def initialize(version, payload, conversation_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'conversation_sid' => payload['conversation_sid'],
                  'sid' => payload['sid'],
                  'index' => payload['index'].to_i,
                  'author' => payload['author'],
                  'body' => payload['body'],
                  'media' => payload['media'],
                  'attributes' => payload['attributes'],
                  'participant_sid' => payload['participant_sid'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'url' => payload['url'],
                  'delivery' => payload['delivery'],
                  'links' => payload['links'],
              }

              # Context
              @instance_context = nil
              @params = {'conversation_sid' => conversation_sid, 'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [MessageContext] MessageContext for this MessageInstance
            def context
              unless @instance_context
                @instance_context = MessageContext.new(@version, @params['conversation_sid'], @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The unique ID of the Account responsible for this message.
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] The unique ID of the Conversation for this message.
            def conversation_sid
              @properties['conversation_sid']
            end

            ##
            # @return [String] A 34 character string that uniquely identifies this resource.
            def sid
              @properties['sid']
            end

            ##
            # @return [String] The index of the message within the Conversation.
            def index
              @properties['index']
            end

            ##
            # @return [String] The channel specific identifier of the message's author.
            def author
              @properties['author']
            end

            ##
            # @return [String] The content of the message.
            def body
              @properties['body']
            end

            ##
            # @return [Array[Hash]] An array of objects that describe the Message's media if attached, otherwise, null.
            def media
              @properties['media']
            end

            ##
            # @return [String] A string metadata field you can use to store any data you wish.
            def attributes
              @properties['attributes']
            end

            ##
            # @return [String] The unique ID of messages's author participant.
            def participant_sid
              @properties['participant_sid']
            end

            ##
            # @return [Time] The date that this resource was created.
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The date that this resource was last updated.
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] An absolute API URL for this message.
            def url
              @properties['url']
            end

            ##
            # @return [Hash] An object that contains the summary of delivery statuses for the message to non-chat participants.
            def delivery
              @properties['delivery']
            end

            ##
            # @return [String] Absolute URL to access the receipts of this message.
            def links
              @properties['links']
            end

            ##
            # Update the MessageInstance
            # @param [String] author The channel specific identifier of the message's author.
            #   Defaults to `system`.
            # @param [String] body The content of the message, can be up to 1,600 characters
            #   long.
            # @param [Time] date_created The date that this resource was created.
            # @param [Time] date_updated The date that this resource was last updated. `null`
            #   if the message has not been edited.
            # @param [String] attributes A string metadata field you can use to store any data
            #   you wish. The string value must contain structurally valid JSON if specified.
            #   **Note** that if the attributes are not set "{}" will be returned.
            # @param [message.WebhookEnabledType] x_twilio_webhook_enabled The
            #   X-Twilio-Webhook-Enabled HTTP request header
            # @return [MessageInstance] Updated MessageInstance
            def update(author: :unset, body: :unset, date_created: :unset, date_updated: :unset, attributes: :unset, x_twilio_webhook_enabled: :unset)
              context.update(
                  author: author,
                  body: body,
                  date_created: date_created,
                  date_updated: date_updated,
                  attributes: attributes,
                  x_twilio_webhook_enabled: x_twilio_webhook_enabled,
              )
            end

            ##
            # Delete the MessageInstance
            # @param [message.WebhookEnabledType] x_twilio_webhook_enabled The
            #   X-Twilio-Webhook-Enabled HTTP request header
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete(x_twilio_webhook_enabled: :unset)
              context.delete(x_twilio_webhook_enabled: x_twilio_webhook_enabled, )
            end

            ##
            # Fetch the MessageInstance
            # @return [MessageInstance] Fetched MessageInstance
            def fetch
              context.fetch
            end

            ##
            # Access the delivery_receipts
            # @return [delivery_receipts] delivery_receipts
            def delivery_receipts
              context.delivery_receipts
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Conversations.V1.MessageInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Conversations.V1.MessageInstance #{values}>"
            end
          end
        end
      end
    end
  end
end
