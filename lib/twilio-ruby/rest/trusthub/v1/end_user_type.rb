##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Textgrid
  module REST
    class Trusthub < Domain
      class V1 < Version
        class EndUserTypeList < ListResource
          ##
          # Initialize the EndUserTypeList
          # @param [Version] version Version that contains the resource
          # @return [EndUserTypeList] EndUserTypeList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/EndUserTypes"
          end

          ##
          # Lists EndUserTypeInstance records from the API as a list.
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
          # Streams EndUserTypeInstance records from the API as an Enumerable.
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
          # When passed a block, yields EndUserTypeInstance records from the API.
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
          # Retrieve a single page of EndUserTypeInstance records from the API.
          # Request is executed immediately.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of EndUserTypeInstance
          def page(page_token: :unset, page_number: :unset, page_size: :unset)
            params = Textgrid::Values.of({
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            })

            response = @version.page('GET', @uri, params: params)

            EndUserTypePage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of EndUserTypeInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of EndUserTypeInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            EndUserTypePage.new(@version, response, @solution)
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Trusthub.V1.EndUserTypeList>'
          end
        end

        class EndUserTypePage < Page
          ##
          # Initialize the EndUserTypePage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [EndUserTypePage] EndUserTypePage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of EndUserTypeInstance
          # @param [Hash] payload Payload response from the API
          # @return [EndUserTypeInstance] EndUserTypeInstance
          def get_instance(payload)
            EndUserTypeInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Trusthub.V1.EndUserTypePage>'
          end
        end

        class EndUserTypeContext < InstanceContext
          ##
          # Initialize the EndUserTypeContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The unique string that identifies the End-User Type
          #   resource.
          # @return [EndUserTypeContext] EndUserTypeContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {sid: sid, }
            @uri = "/EndUserTypes/#{@solution[:sid]}"
          end

          ##
          # Fetch the EndUserTypeInstance
          # @return [EndUserTypeInstance] Fetched EndUserTypeInstance
          def fetch
            payload = @version.fetch('GET', @uri)

            EndUserTypeInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Trusthub.V1.EndUserTypeContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Trusthub.V1.EndUserTypeContext #{context}>"
          end
        end

        class EndUserTypeInstance < InstanceResource
          ##
          # Initialize the EndUserTypeInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The unique string that identifies the End-User Type
          #   resource.
          # @return [EndUserTypeInstance] EndUserTypeInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'sid' => payload['sid'],
                'friendly_name' => payload['friendly_name'],
                'machine_name' => payload['machine_name'],
                'fields' => payload['fields'],
                'url' => payload['url'],
            }

            # Context
            @instance_context = nil
            @params = {'sid' => sid || @properties['sid'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [EndUserTypeContext] EndUserTypeContext for this EndUserTypeInstance
          def context
            unless @instance_context
              @instance_context = EndUserTypeContext.new(@version, @params['sid'], )
            end
            @instance_context
          end

          ##
          # @return [String] The unique string that identifies the End-User Type resource
          def sid
            @properties['sid']
          end

          ##
          # @return [String] A human-readable description of the End-User Type resource
          def friendly_name
            @properties['friendly_name']
          end

          ##
          # @return [String] A machine-readable description of the End-User Type resource
          def machine_name
            @properties['machine_name']
          end

          ##
          # @return [Array[Hash]] The required information for creating an End-User.
          def fields
            @properties['fields']
          end

          ##
          # @return [String] The absolute URL of the End-User Type resource
          def url
            @properties['url']
          end

          ##
          # Fetch the EndUserTypeInstance
          # @return [EndUserTypeInstance] Fetched EndUserTypeInstance
          def fetch
            context.fetch
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Trusthub.V1.EndUserTypeInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Trusthub.V1.EndUserTypeInstance #{values}>"
          end
        end
      end
    end
  end
end
