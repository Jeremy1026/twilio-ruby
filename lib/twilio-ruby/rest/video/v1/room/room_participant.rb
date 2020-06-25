##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Video < Domain
      class V1 < Version
        class RoomContext < InstanceContext
          class ParticipantList < ListResource
            ##
            # Initialize the ParticipantList
            # @param [Version] version Version that contains the resource
            # @param [String] room_sid The SID of the participant's room.
            # @return [ParticipantList] ParticipantList
            def initialize(version, room_sid: nil)
              super(version)

              # Path Solution
              @solution = {room_sid: room_sid}
              @uri = "/Rooms/#{@solution[:room_sid]}/Participants"
            end

            ##
            # Lists ParticipantInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [participant.Status] status Read only the participants with this status.
            #   Can be: `connected` or `disconnected`. For `in-progress` Rooms the default
            #   Status is `connected`, for `completed` Rooms only `disconnected` Participants
            #   are returned.
            # @param [String] identity Read only the Participants with this
            #   [User](https://www.twilio.com/docs/chat/rest/user-resource) `identity` value.
            # @param [Time] date_created_after Read only Participants that started after this
            #   date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601#UTC) format.
            # @param [Time] date_created_before Read only Participants that started before
            #   this date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601#UTC) format.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(status: :unset, identity: :unset, date_created_after: :unset, date_created_before: :unset, limit: nil, page_size: nil)
              self.stream(
                  status: status,
                  identity: identity,
                  date_created_after: date_created_after,
                  date_created_before: date_created_before,
                  limit: limit,
                  page_size: page_size
              ).entries
            end

            ##
            # Streams ParticipantInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [participant.Status] status Read only the participants with this status.
            #   Can be: `connected` or `disconnected`. For `in-progress` Rooms the default
            #   Status is `connected`, for `completed` Rooms only `disconnected` Participants
            #   are returned.
            # @param [String] identity Read only the Participants with this
            #   [User](https://www.twilio.com/docs/chat/rest/user-resource) `identity` value.
            # @param [Time] date_created_after Read only Participants that started after this
            #   date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601#UTC) format.
            # @param [Time] date_created_before Read only Participants that started before
            #   this date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601#UTC) format.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(status: :unset, identity: :unset, date_created_after: :unset, date_created_before: :unset, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(
                  status: status,
                  identity: identity,
                  date_created_after: date_created_after,
                  date_created_before: date_created_before,
                  page_size: limits[:page_size],
              )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields ParticipantInstance records from the API.
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
            # Retrieve a single page of ParticipantInstance records from the API.
            # Request is executed immediately.
            # @param [participant.Status] status Read only the participants with this status.
            #   Can be: `connected` or `disconnected`. For `in-progress` Rooms the default
            #   Status is `connected`, for `completed` Rooms only `disconnected` Participants
            #   are returned.
            # @param [String] identity Read only the Participants with this
            #   [User](https://www.twilio.com/docs/chat/rest/user-resource) `identity` value.
            # @param [Time] date_created_after Read only Participants that started after this
            #   date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601#UTC) format.
            # @param [Time] date_created_before Read only Participants that started before
            #   this date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601#UTC) format.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of ParticipantInstance
            def page(status: :unset, identity: :unset, date_created_after: :unset, date_created_before: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'Status' => status,
                  'Identity' => identity,
                  'DateCreatedAfter' => Twilio.serialize_iso8601_datetime(date_created_after),
                  'DateCreatedBefore' => Twilio.serialize_iso8601_datetime(date_created_before),
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })

              response = @version.page('GET', @uri, params)

              ParticipantPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of ParticipantInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of ParticipantInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              ParticipantPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Video.V1.ParticipantList>'
            end
          end

          class ParticipantPage < Page
            ##
            # Initialize the ParticipantPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [ParticipantPage] ParticipantPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of ParticipantInstance
            # @param [Hash] payload Payload response from the API
            # @return [ParticipantInstance] ParticipantInstance
            def get_instance(payload)
              ParticipantInstance.new(@version, payload, room_sid: @solution[:room_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Video.V1.ParticipantPage>'
            end
          end

          class ParticipantContext < InstanceContext
            ##
            # Initialize the ParticipantContext
            # @param [Version] version Version that contains the resource
            # @param [String] room_sid The SID of the room with the Participant resource to
            #   fetch.
            # @param [String] sid The SID of the RoomParticipant resource to fetch.
            # @return [ParticipantContext] ParticipantContext
            def initialize(version, room_sid, sid)
              super(version)

              # Path Solution
              @solution = {room_sid: room_sid, sid: sid, }
              @uri = "/Rooms/#{@solution[:room_sid]}/Participants/#{@solution[:sid]}"

              # Dependents
              @published_tracks = nil
              @subscribed_tracks = nil
              @subscribe_rules = nil
            end

            ##
            # Fetch the ParticipantInstance
            # @return [ParticipantInstance] Fetched ParticipantInstance
            def fetch
              payload = @version.fetch('GET', @uri)

              ParticipantInstance.new(@version, payload, room_sid: @solution[:room_sid], sid: @solution[:sid], )
            end

            ##
            # Update the ParticipantInstance
            # @param [participant.Status] status The new status of the resource. Can be:
            #   `connected` or `disconnected`. For `in-progress` Rooms the default Status is
            #   `connected`, for `completed` Rooms only `disconnected` Participants are
            #   returned.
            # @return [ParticipantInstance] Updated ParticipantInstance
            def update(status: :unset)
              data = Twilio::Values.of({'Status' => status, })

              payload = @version.update('POST', @uri, data: data)

              ParticipantInstance.new(@version, payload, room_sid: @solution[:room_sid], sid: @solution[:sid], )
            end

            ##
            # Access the published_tracks
            # @return [PublishedTrackList]
            # @return [PublishedTrackContext] if sid was passed.
            def published_tracks(sid=:unset)
              raise ArgumentError, 'sid cannot be nil' if sid.nil?

              if sid != :unset
                return PublishedTrackContext.new(@version, @solution[:room_sid], @solution[:sid], sid, )
              end

              unless @published_tracks
                @published_tracks = PublishedTrackList.new(
                    @version,
                    room_sid: @solution[:room_sid],
                    participant_sid: @solution[:sid],
                )
              end

              @published_tracks
            end

            ##
            # Access the subscribed_tracks
            # @return [SubscribedTrackList]
            # @return [SubscribedTrackContext] if sid was passed.
            def subscribed_tracks(sid=:unset)
              raise ArgumentError, 'sid cannot be nil' if sid.nil?

              if sid != :unset
                return SubscribedTrackContext.new(@version, @solution[:room_sid], @solution[:sid], sid, )
              end

              unless @subscribed_tracks
                @subscribed_tracks = SubscribedTrackList.new(
                    @version,
                    room_sid: @solution[:room_sid],
                    participant_sid: @solution[:sid],
                )
              end

              @subscribed_tracks
            end

            ##
            # Access the subscribe_rules
            # @return [SubscribeRulesList]
            # @return [SubscribeRulesContext]
            def subscribe_rules
              unless @subscribe_rules
                @subscribe_rules = SubscribeRulesList.new(
                    @version,
                    room_sid: @solution[:room_sid],
                    participant_sid: @solution[:sid],
                )
              end

              @subscribe_rules
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Video.V1.ParticipantContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Video.V1.ParticipantContext #{context}>"
            end
          end

          class ParticipantInstance < InstanceResource
            ##
            # Initialize the ParticipantInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] room_sid The SID of the participant's room.
            # @param [String] sid The SID of the RoomParticipant resource to fetch.
            # @return [ParticipantInstance] ParticipantInstance
            def initialize(version, payload, room_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'room_sid' => payload['room_sid'],
                  'account_sid' => payload['account_sid'],
                  'status' => payload['status'],
                  'identity' => payload['identity'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'start_time' => Twilio.deserialize_iso8601_datetime(payload['start_time']),
                  'end_time' => Twilio.deserialize_iso8601_datetime(payload['end_time']),
                  'duration' => payload['duration'] == nil ? payload['duration'] : payload['duration'].to_i,
                  'url' => payload['url'],
                  'links' => payload['links'],
              }

              # Context
              @instance_context = nil
              @params = {'room_sid' => room_sid, 'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [ParticipantContext] ParticipantContext for this ParticipantInstance
            def context
              unless @instance_context
                @instance_context = ParticipantContext.new(@version, @params['room_sid'], @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The unique string that identifies the resource
            def sid
              @properties['sid']
            end

            ##
            # @return [String] The SID of the participant's room
            def room_sid
              @properties['room_sid']
            end

            ##
            # @return [String] The SID of the Account that created the resource
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [participant.Status] The status of the Participant
            def status
              @properties['status']
            end

            ##
            # @return [String] The string that identifies the resource's User
            def identity
              @properties['identity']
            end

            ##
            # @return [Time] The ISO 8601 date and time in GMT when the resource was created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The ISO 8601 date and time in GMT when the resource was last updated
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [Time] The time of participant connected to the room in ISO 8601 format
            def start_time
              @properties['start_time']
            end

            ##
            # @return [Time] The time when the participant disconnected from the room in ISO 8601 format
            def end_time
              @properties['end_time']
            end

            ##
            # @return [String] Duration of time in seconds the participant was connected
            def duration
              @properties['duration']
            end

            ##
            # @return [String] The absolute URL of the resource
            def url
              @properties['url']
            end

            ##
            # @return [String] The URLs of related resources
            def links
              @properties['links']
            end

            ##
            # Fetch the ParticipantInstance
            # @return [ParticipantInstance] Fetched ParticipantInstance
            def fetch
              context.fetch
            end

            ##
            # Update the ParticipantInstance
            # @param [participant.Status] status The new status of the resource. Can be:
            #   `connected` or `disconnected`. For `in-progress` Rooms the default Status is
            #   `connected`, for `completed` Rooms only `disconnected` Participants are
            #   returned.
            # @return [ParticipantInstance] Updated ParticipantInstance
            def update(status: :unset)
              context.update(status: status, )
            end

            ##
            # Access the published_tracks
            # @return [published_tracks] published_tracks
            def published_tracks
              context.published_tracks
            end

            ##
            # Access the subscribed_tracks
            # @return [subscribed_tracks] subscribed_tracks
            def subscribed_tracks
              context.subscribed_tracks
            end

            ##
            # Access the subscribe_rules
            # @return [subscribe_rules] subscribe_rules
            def subscribe_rules
              context.subscribe_rules
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Video.V1.ParticipantInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Video.V1.ParticipantInstance #{values}>"
            end
          end
        end
      end
    end
  end
end