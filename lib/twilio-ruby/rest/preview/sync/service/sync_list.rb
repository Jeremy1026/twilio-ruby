##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Textgrid
  module REST
    class Preview < Domain
      class Sync < Version
        class ServiceContext < InstanceContext
          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class SyncListList < ListResource
            ##
            # Initialize the SyncListList
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The service_sid
            # @return [SyncListList] SyncListList
            def initialize(version, service_sid: nil)
              super(version)

              # Path Solution
              @solution = {service_sid: service_sid}
              @uri = "/Services/#{@solution[:service_sid]}/Lists"
            end

            ##
            # Create the SyncListInstance
            # @param [String] unique_name The unique_name
            # @return [SyncListInstance] Created SyncListInstance
            def create(unique_name: :unset)
              data = Textgrid::Values.of({'UniqueName' => unique_name, })

              payload = @version.create('POST', @uri, data: data)

              SyncListInstance.new(@version, payload, service_sid: @solution[:service_sid], )
            end

            ##
            # Lists SyncListInstance records from the API as a list.
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
            # Streams SyncListInstance records from the API as an Enumerable.
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
            # When passed a block, yields SyncListInstance records from the API.
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
            # Retrieve a single page of SyncListInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of SyncListInstance
            def page(page_token: :unset, page_number: :unset, page_size: :unset)
              params = Textgrid::Values.of({
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })

              response = @version.page('GET', @uri, params: params)

              SyncListPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of SyncListInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of SyncListInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              SyncListPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Preview.Sync.SyncListList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class SyncListPage < Page
            ##
            # Initialize the SyncListPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [SyncListPage] SyncListPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of SyncListInstance
            # @param [Hash] payload Payload response from the API
            # @return [SyncListInstance] SyncListInstance
            def get_instance(payload)
              SyncListInstance.new(@version, payload, service_sid: @solution[:service_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Preview.Sync.SyncListPage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class SyncListContext < InstanceContext
            ##
            # Initialize the SyncListContext
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The service_sid
            # @param [String] sid The sid
            # @return [SyncListContext] SyncListContext
            def initialize(version, service_sid, sid)
              super(version)

              # Path Solution
              @solution = {service_sid: service_sid, sid: sid, }
              @uri = "/Services/#{@solution[:service_sid]}/Lists/#{@solution[:sid]}"

              # Dependents
              @sync_list_items = nil
              @sync_list_permissions = nil
            end

            ##
            # Fetch the SyncListInstance
            # @return [SyncListInstance] Fetched SyncListInstance
            def fetch
              payload = @version.fetch('GET', @uri)

              SyncListInstance.new(@version, payload, service_sid: @solution[:service_sid], sid: @solution[:sid], )
            end

            ##
            # Delete the SyncListInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
               @version.delete('DELETE', @uri)
            end

            ##
            # Access the sync_list_items
            # @return [SyncListItemList]
            # @return [SyncListItemContext] if index was passed.
            def sync_list_items(index=:unset)
              raise ArgumentError, 'index cannot be nil' if index.nil?

              if index != :unset
                return SyncListItemContext.new(@version, @solution[:service_sid], @solution[:sid], index, )
              end

              unless @sync_list_items
                @sync_list_items = SyncListItemList.new(
                    @version,
                    service_sid: @solution[:service_sid],
                    list_sid: @solution[:sid],
                )
              end

              @sync_list_items
            end

            ##
            # Access the sync_list_permissions
            # @return [SyncListPermissionList]
            # @return [SyncListPermissionContext] if identity was passed.
            def sync_list_permissions(identity=:unset)
              raise ArgumentError, 'identity cannot be nil' if identity.nil?

              if identity != :unset
                return SyncListPermissionContext.new(@version, @solution[:service_sid], @solution[:sid], identity, )
              end

              unless @sync_list_permissions
                @sync_list_permissions = SyncListPermissionList.new(
                    @version,
                    service_sid: @solution[:service_sid],
                    list_sid: @solution[:sid],
                )
              end

              @sync_list_permissions
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Preview.Sync.SyncListContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Preview.Sync.SyncListContext #{context}>"
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class SyncListInstance < InstanceResource
            ##
            # Initialize the SyncListInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] service_sid The service_sid
            # @param [String] sid The sid
            # @return [SyncListInstance] SyncListInstance
            def initialize(version, payload, service_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'unique_name' => payload['unique_name'],
                  'account_sid' => payload['account_sid'],
                  'service_sid' => payload['service_sid'],
                  'url' => payload['url'],
                  'links' => payload['links'],
                  'revision' => payload['revision'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'created_by' => payload['created_by'],
              }

              # Context
              @instance_context = nil
              @params = {'service_sid' => service_sid, 'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [SyncListContext] SyncListContext for this SyncListInstance
            def context
              unless @instance_context
                @instance_context = SyncListContext.new(@version, @params['service_sid'], @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The sid
            def sid
              @properties['sid']
            end

            ##
            # @return [String] The unique_name
            def unique_name
              @properties['unique_name']
            end

            ##
            # @return [String] The account_sid
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] The service_sid
            def service_sid
              @properties['service_sid']
            end

            ##
            # @return [String] The url
            def url
              @properties['url']
            end

            ##
            # @return [String] The links
            def links
              @properties['links']
            end

            ##
            # @return [String] The revision
            def revision
              @properties['revision']
            end

            ##
            # @return [Time] The date_created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The date_updated
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] The created_by
            def created_by
              @properties['created_by']
            end

            ##
            # Fetch the SyncListInstance
            # @return [SyncListInstance] Fetched SyncListInstance
            def fetch
              context.fetch
            end

            ##
            # Delete the SyncListInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
              context.delete
            end

            ##
            # Access the sync_list_items
            # @return [sync_list_items] sync_list_items
            def sync_list_items
              context.sync_list_items
            end

            ##
            # Access the sync_list_permissions
            # @return [sync_list_permissions] sync_list_permissions
            def sync_list_permissions
              context.sync_list_permissions
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Preview.Sync.SyncListInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Preview.Sync.SyncListInstance #{values}>"
            end
          end
        end
      end
    end
  end
end
