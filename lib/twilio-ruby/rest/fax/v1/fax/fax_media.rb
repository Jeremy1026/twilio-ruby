##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Textgrid
  module REST
    class Fax < Domain
      class V1 < Version
        class FaxContext < InstanceContext
          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class FaxMediaList < ListResource
            ##
            # Initialize the FaxMediaList
            # @param [Version] version Version that contains the resource
            # @param [String] fax_sid The SID of the fax the FaxMedia resource is associated
            #   with.
            # @return [FaxMediaList] FaxMediaList
            def initialize(version, fax_sid: nil)
              super(version)

              # Path Solution
              @solution = {fax_sid: fax_sid}
              @uri = "/Faxes/#{@solution[:fax_sid]}/Media"
            end

            ##
            # Lists FaxMediaInstance records from the API as a list.
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
            # Streams FaxMediaInstance records from the API as an Enumerable.
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
            # When passed a block, yields FaxMediaInstance records from the API.
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
            # Retrieve a single page of FaxMediaInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of FaxMediaInstance
            def page(page_token: :unset, page_number: :unset, page_size: :unset)
              params = Textgrid::Values.of({
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })

              response = @version.page('GET', @uri, params: params)

              FaxMediaPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of FaxMediaInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of FaxMediaInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              FaxMediaPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Fax.V1.FaxMediaList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class FaxMediaPage < Page
            ##
            # Initialize the FaxMediaPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [FaxMediaPage] FaxMediaPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of FaxMediaInstance
            # @param [Hash] payload Payload response from the API
            # @return [FaxMediaInstance] FaxMediaInstance
            def get_instance(payload)
              FaxMediaInstance.new(@version, payload, fax_sid: @solution[:fax_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Fax.V1.FaxMediaPage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class FaxMediaContext < InstanceContext
            ##
            # Initialize the FaxMediaContext
            # @param [Version] version Version that contains the resource
            # @param [String] fax_sid The SID of the fax with the FaxMedia resource to fetch.
            # @param [String] sid The Twilio-provided string that uniquely identifies the
            #   FaxMedia resource to fetch.
            # @return [FaxMediaContext] FaxMediaContext
            def initialize(version, fax_sid, sid)
              super(version)

              # Path Solution
              @solution = {fax_sid: fax_sid, sid: sid, }
              @uri = "/Faxes/#{@solution[:fax_sid]}/Media/#{@solution[:sid]}"
            end

            ##
            # Fetch the FaxMediaInstance
            # @return [FaxMediaInstance] Fetched FaxMediaInstance
            def fetch
              payload = @version.fetch('GET', @uri)

              FaxMediaInstance.new(@version, payload, fax_sid: @solution[:fax_sid], sid: @solution[:sid], )
            end

            ##
            # Delete the FaxMediaInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
               @version.delete('DELETE', @uri)
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Fax.V1.FaxMediaContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Fax.V1.FaxMediaContext #{context}>"
            end
          end

          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class FaxMediaInstance < InstanceResource
            ##
            # Initialize the FaxMediaInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] fax_sid The SID of the fax the FaxMedia resource is associated
            #   with.
            # @param [String] sid The Twilio-provided string that uniquely identifies the
            #   FaxMedia resource to fetch.
            # @return [FaxMediaInstance] FaxMediaInstance
            def initialize(version, payload, fax_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'account_sid' => payload['account_sid'],
                  'fax_sid' => payload['fax_sid'],
                  'content_type' => payload['content_type'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'url' => payload['url'],
              }

              # Context
              @instance_context = nil
              @params = {'fax_sid' => fax_sid, 'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [FaxMediaContext] FaxMediaContext for this FaxMediaInstance
            def context
              unless @instance_context
                @instance_context = FaxMediaContext.new(@version, @params['fax_sid'], @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The unique string that identifies the resource
            def sid
              @properties['sid']
            end

            ##
            # @return [String] The SID of the Account that created the resource
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] The SID of the fax the FaxMedia resource is associated with
            def fax_sid
              @properties['fax_sid']
            end

            ##
            # @return [String] The content type of the stored fax media
            def content_type
              @properties['content_type']
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
            # @return [String] The absolute URL of the FaxMedia resource
            def url
              @properties['url']
            end

            ##
            # Fetch the FaxMediaInstance
            # @return [FaxMediaInstance] Fetched FaxMediaInstance
            def fetch
              context.fetch
            end

            ##
            # Delete the FaxMediaInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
              context.delete
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Fax.V1.FaxMediaInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Fax.V1.FaxMediaInstance #{values}>"
            end
          end
        end
      end
    end
  end
end
