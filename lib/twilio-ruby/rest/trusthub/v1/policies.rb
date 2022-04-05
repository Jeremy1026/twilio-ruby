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
        class PoliciesList < ListResource
          ##
          # Initialize the PoliciesList
          # @param [Version] version Version that contains the resource
          # @return [PoliciesList] PoliciesList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Policies"
          end

          ##
          # Lists PoliciesInstance records from the API as a list.
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
          # Streams PoliciesInstance records from the API as an Enumerable.
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
          # When passed a block, yields PoliciesInstance records from the API.
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
          # Retrieve a single page of PoliciesInstance records from the API.
          # Request is executed immediately.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of PoliciesInstance
          def page(page_token: :unset, page_number: :unset, page_size: :unset)
            params = Textgrid::Values.of({
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            })

            response = @version.page('GET', @uri, params: params)

            PoliciesPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of PoliciesInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of PoliciesInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            PoliciesPage.new(@version, response, @solution)
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Trusthub.V1.PoliciesList>'
          end
        end

        class PoliciesPage < Page
          ##
          # Initialize the PoliciesPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [PoliciesPage] PoliciesPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of PoliciesInstance
          # @param [Hash] payload Payload response from the API
          # @return [PoliciesInstance] PoliciesInstance
          def get_instance(payload)
            PoliciesInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Trusthub.V1.PoliciesPage>'
          end
        end

        class PoliciesContext < InstanceContext
          ##
          # Initialize the PoliciesContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The unique string that identifies the Policy resource.
          # @return [PoliciesContext] PoliciesContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {sid: sid, }
            @uri = "/Policies/#{@solution[:sid]}"
          end

          ##
          # Fetch the PoliciesInstance
          # @return [PoliciesInstance] Fetched PoliciesInstance
          def fetch
            payload = @version.fetch('GET', @uri)

            PoliciesInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Trusthub.V1.PoliciesContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Trusthub.V1.PoliciesContext #{context}>"
          end
        end

        class PoliciesInstance < InstanceResource
          ##
          # Initialize the PoliciesInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The unique string that identifies the Policy resource.
          # @return [PoliciesInstance] PoliciesInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'sid' => payload['sid'],
                'friendly_name' => payload['friendly_name'],
                'requirements' => payload['requirements'],
                'url' => payload['url'],
            }

            # Context
            @instance_context = nil
            @params = {'sid' => sid || @properties['sid'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [PoliciesContext] PoliciesContext for this PoliciesInstance
          def context
            unless @instance_context
              @instance_context = PoliciesContext.new(@version, @params['sid'], )
            end
            @instance_context
          end

          ##
          # @return [String] The unique string that identifies the Policy resource
          def sid
            @properties['sid']
          end

          ##
          # @return [String] A human-readable description of the Policy resource
          def friendly_name
            @properties['friendly_name']
          end

          ##
          # @return [Hash] The sid of a Policy object that dictates requirements
          def requirements
            @properties['requirements']
          end

          ##
          # @return [String] The absolute URL of the Policy resource
          def url
            @properties['url']
          end

          ##
          # Fetch the PoliciesInstance
          # @return [PoliciesInstance] Fetched PoliciesInstance
          def fetch
            context.fetch
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Trusthub.V1.PoliciesInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Trusthub.V1.PoliciesInstance #{values}>"
          end
        end
      end
    end
  end
end
