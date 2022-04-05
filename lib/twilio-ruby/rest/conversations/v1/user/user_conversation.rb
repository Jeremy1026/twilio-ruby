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
        class UserContext < InstanceContext
          class UserConversationList < ListResource
            ##
            # Initialize the UserConversationList
            # @param [Version] version Version that contains the resource
            # @param [String] user_sid The unique string that identifies the {User
            #   resource}[https://www.twilio.com/docs/conversations/api/user-resource].
            # @return [UserConversationList] UserConversationList
            def initialize(version, user_sid: nil)
              super(version)

              # Path Solution
              @solution = {user_sid: user_sid}
              @uri = "/Users/#{@solution[:user_sid]}/Conversations"
            end

            ##
            # Lists UserConversationInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(limit: nil, page_size: nil)
              self.stream(limit: limit, page_size: page_size).entries
            end

            ##
            # Streams UserConversationInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(page_size: limits[:page_size], )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields UserConversationInstance records from the API.
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
            # Retrieve a single page of UserConversationInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of UserConversationInstance
            def page(page_token: :unset, page_number: :unset, page_size: :unset)
              params = Textgrid::Values.of({
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })

              response = @version.page('GET', @uri, params: params)

              UserConversationPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of UserConversationInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of UserConversationInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              UserConversationPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Conversations.V1.UserConversationList>'
            end
          end

          class UserConversationPage < Page
            ##
            # Initialize the UserConversationPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [UserConversationPage] UserConversationPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of UserConversationInstance
            # @param [Hash] payload Payload response from the API
            # @return [UserConversationInstance] UserConversationInstance
            def get_instance(payload)
              UserConversationInstance.new(@version, payload, user_sid: @solution[:user_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Conversations.V1.UserConversationPage>'
            end
          end

          class UserConversationContext < InstanceContext
            ##
            # Initialize the UserConversationContext
            # @param [Version] version Version that contains the resource
            # @param [String] user_sid The unique SID identifier of the {User
            #   resource}[https://www.twilio.com/docs/conversations/api/user-resource]. This
            #   value can be either the `sid` or the `identity` of the User resource.
            # @param [String] conversation_sid The unique SID identifier of the Conversation.
            #   This value can be either the `sid` or the `unique_name` of the {Conversation
            #   resource}[https://www.twilio.com/docs/conversations/api/conversation-resource].
            # @return [UserConversationContext] UserConversationContext
            def initialize(version, user_sid, conversation_sid)
              super(version)

              # Path Solution
              @solution = {user_sid: user_sid, conversation_sid: conversation_sid, }
              @uri = "/Users/#{@solution[:user_sid]}/Conversations/#{@solution[:conversation_sid]}"
            end

            ##
            # Update the UserConversationInstance
            # @param [user_conversation.NotificationLevel] notification_level The Notification
            #   Level of this User Conversation. One of `default` or `muted`.
            # @param [Time] last_read_timestamp The date of the last message read in
            #   conversation by the user, given in ISO 8601 format.
            # @param [String] last_read_message_index The index of the last Message in the
            #   Conversation that the Participant has read.
            # @return [UserConversationInstance] Updated UserConversationInstance
            def update(notification_level: :unset, last_read_timestamp: :unset, last_read_message_index: :unset)
              data = Textgrid::Values.of({
                  'NotificationLevel' => notification_level,
                  'LastReadTimestamp' => Twilio.serialize_iso8601_datetime(last_read_timestamp),
                  'LastReadMessageIndex' => last_read_message_index,
              })

              payload = @version.update('POST', @uri, data: data)

              UserConversationInstance.new(
                  @version,
                  payload,
                  user_sid: @solution[:user_sid],
                  conversation_sid: @solution[:conversation_sid],
              )
            end

            ##
            # Delete the UserConversationInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
               @version.delete('DELETE', @uri)
            end

            ##
            # Fetch the UserConversationInstance
            # @return [UserConversationInstance] Fetched UserConversationInstance
            def fetch
              payload = @version.fetch('GET', @uri)

              UserConversationInstance.new(
                  @version,
                  payload,
                  user_sid: @solution[:user_sid],
                  conversation_sid: @solution[:conversation_sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Conversations.V1.UserConversationContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Conversations.V1.UserConversationContext #{context}>"
            end
          end

          class UserConversationInstance < InstanceResource
            ##
            # Initialize the UserConversationInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] user_sid The unique string that identifies the {User
            #   resource}[https://www.twilio.com/docs/conversations/api/user-resource].
            # @param [String] conversation_sid The unique SID identifier of the Conversation.
            #   This value can be either the `sid` or the `unique_name` of the {Conversation
            #   resource}[https://www.twilio.com/docs/conversations/api/conversation-resource].
            # @return [UserConversationInstance] UserConversationInstance
            def initialize(version, payload, user_sid: nil, conversation_sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'chat_service_sid' => payload['chat_service_sid'],
                  'conversation_sid' => payload['conversation_sid'],
                  'unread_messages_count' => payload['unread_messages_count'] == nil ? payload['unread_messages_count'] : payload['unread_messages_count'].to_i,
                  'last_read_message_index' => payload['last_read_message_index'] == nil ? payload['last_read_message_index'] : payload['last_read_message_index'].to_i,
                  'participant_sid' => payload['participant_sid'],
                  'user_sid' => payload['user_sid'],
                  'friendly_name' => payload['friendly_name'],
                  'conversation_state' => payload['conversation_state'],
                  'timers' => payload['timers'],
                  'attributes' => payload['attributes'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'created_by' => payload['created_by'],
                  'notification_level' => payload['notification_level'],
                  'unique_name' => payload['unique_name'],
                  'url' => payload['url'],
                  'links' => payload['links'],
              }

              # Context
              @instance_context = nil
              @params = {
                  'user_sid' => user_sid,
                  'conversation_sid' => conversation_sid || @properties['conversation_sid'],
              }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [UserConversationContext] UserConversationContext for this UserConversationInstance
            def context
              unless @instance_context
                @instance_context = UserConversationContext.new(
                    @version,
                    @params['user_sid'],
                    @params['conversation_sid'],
                )
              end
              @instance_context
            end

            ##
            # @return [String] The unique ID of the Account responsible for this conversation.
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] The unique ID of the Conversation Service this conversation belongs to.
            def chat_service_sid
              @properties['chat_service_sid']
            end

            ##
            # @return [String] The unique ID of the Conversation for this User Conversation.
            def conversation_sid
              @properties['conversation_sid']
            end

            ##
            # @return [String] The number of unread Messages in the Conversation.
            def unread_messages_count
              @properties['unread_messages_count']
            end

            ##
            # @return [String] The index of the last read Message .
            def last_read_message_index
              @properties['last_read_message_index']
            end

            ##
            # @return [String] Participant Sid.
            def participant_sid
              @properties['participant_sid']
            end

            ##
            # @return [String] The unique ID for the User.
            def user_sid
              @properties['user_sid']
            end

            ##
            # @return [String] The human-readable name of this conversation.
            def friendly_name
              @properties['friendly_name']
            end

            ##
            # @return [user_conversation.State] The current state of this User Conversation
            def conversation_state
              @properties['conversation_state']
            end

            ##
            # @return [Hash] Timer date values for this conversation.
            def timers
              @properties['timers']
            end

            ##
            # @return [String] An optional string metadata field you can use to store any data you wish.
            def attributes
              @properties['attributes']
            end

            ##
            # @return [Time] The date that this conversation was created.
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The date that this conversation was last updated.
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] Creator of this conversation.
            def created_by
              @properties['created_by']
            end

            ##
            # @return [user_conversation.NotificationLevel] The Notification Level of this User Conversation.
            def notification_level
              @properties['notification_level']
            end

            ##
            # @return [String] An application-defined string that uniquely identifies the Conversation resource.
            def unique_name
              @properties['unique_name']
            end

            ##
            # @return [String] The url
            def url
              @properties['url']
            end

            ##
            # @return [String] Absolute URLs to access the participant and conversation of this user conversation.
            def links
              @properties['links']
            end

            ##
            # Update the UserConversationInstance
            # @param [user_conversation.NotificationLevel] notification_level The Notification
            #   Level of this User Conversation. One of `default` or `muted`.
            # @param [Time] last_read_timestamp The date of the last message read in
            #   conversation by the user, given in ISO 8601 format.
            # @param [String] last_read_message_index The index of the last Message in the
            #   Conversation that the Participant has read.
            # @return [UserConversationInstance] Updated UserConversationInstance
            def update(notification_level: :unset, last_read_timestamp: :unset, last_read_message_index: :unset)
              context.update(
                  notification_level: notification_level,
                  last_read_timestamp: last_read_timestamp,
                  last_read_message_index: last_read_message_index,
              )
            end

            ##
            # Delete the UserConversationInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
              context.delete
            end

            ##
            # Fetch the UserConversationInstance
            # @return [UserConversationInstance] Fetched UserConversationInstance
            def fetch
              context.fetch
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Conversations.V1.UserConversationInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Conversations.V1.UserConversationInstance #{values}>"
            end
          end
        end
      end
    end
  end
end
