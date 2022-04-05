##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Textgrid
  module REST
    class Sync < Domain
      class V1 < Version
        class ServiceContext < InstanceContext
          class DocumentContext < InstanceContext
            class DocumentPermissionList < ListResource
              ##
              # Initialize the DocumentPermissionList
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The SID of the {Sync
              #   Service}[https://www.twilio.com/docs/sync/api/service] the resource is
              #   associated with.
              # @param [String] document_sid The SID of the Sync Document to which the Document
              #   Permission applies.
              # @return [DocumentPermissionList] DocumentPermissionList
              def initialize(version, service_sid: nil, document_sid: nil)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, document_sid: document_sid}
                @uri = "/Services/#{@solution[:service_sid]}/Documents/#{@solution[:document_sid]}/Permissions"
              end

              ##
              # Lists DocumentPermissionInstance records from the API as a list.
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
              # Streams DocumentPermissionInstance records from the API as an Enumerable.
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
              # When passed a block, yields DocumentPermissionInstance records from the API.
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
              # Retrieve a single page of DocumentPermissionInstance records from the API.
              # Request is executed immediately.
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of DocumentPermissionInstance
              def page(page_token: :unset, page_number: :unset, page_size: :unset)
                params = Textgrid::Values.of({
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                })

                response = @version.page('GET', @uri, params: params)

                DocumentPermissionPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of DocumentPermissionInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of DocumentPermissionInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                DocumentPermissionPage.new(@version, response, @solution)
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Sync.V1.DocumentPermissionList>'
              end
            end

            class DocumentPermissionPage < Page
              ##
              # Initialize the DocumentPermissionPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [DocumentPermissionPage] DocumentPermissionPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of DocumentPermissionInstance
              # @param [Hash] payload Payload response from the API
              # @return [DocumentPermissionInstance] DocumentPermissionInstance
              def get_instance(payload)
                DocumentPermissionInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    document_sid: @solution[:document_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Sync.V1.DocumentPermissionPage>'
              end
            end

            class DocumentPermissionContext < InstanceContext
              ##
              # Initialize the DocumentPermissionContext
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The SID of the {Sync
              #   Service}[https://www.twilio.com/docs/sync/api/service] with the Document
              #   Permission resource to fetch.
              # @param [String] document_sid The SID of the Sync Document with the Document
              #   Permission resource to fetch. Can be the Document resource's `sid` or its
              #   `unique_name`.
              # @param [String] identity The application-defined string that uniquely identifies
              #   the User's Document Permission resource to fetch.
              # @return [DocumentPermissionContext] DocumentPermissionContext
              def initialize(version, service_sid, document_sid, identity)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, document_sid: document_sid, identity: identity, }
                @uri = "/Services/#{@solution[:service_sid]}/Documents/#{@solution[:document_sid]}/Permissions/#{@solution[:identity]}"
              end

              ##
              # Fetch the DocumentPermissionInstance
              # @return [DocumentPermissionInstance] Fetched DocumentPermissionInstance
              def fetch
                payload = @version.fetch('GET', @uri)

                DocumentPermissionInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    document_sid: @solution[:document_sid],
                    identity: @solution[:identity],
                )
              end

              ##
              # Delete the DocumentPermissionInstance
              # @return [Boolean] true if delete succeeds, false otherwise
              def delete
                 @version.delete('DELETE', @uri)
              end

              ##
              # Update the DocumentPermissionInstance
              # @param [Boolean] read Whether the identity can read the Sync Document. Default
              #   value is `false`.
              # @param [Boolean] write Whether the identity can update the Sync Document.
              #   Default value is `false`.
              # @param [Boolean] manage Whether the identity can delete the Sync Document.
              #   Default value is `false`.
              # @return [DocumentPermissionInstance] Updated DocumentPermissionInstance
              def update(read: nil, write: nil, manage: nil)
                data = Textgrid::Values.of({'Read' => read, 'Write' => write, 'Manage' => manage, })

                payload = @version.update('POST', @uri, data: data)

                DocumentPermissionInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    document_sid: @solution[:document_sid],
                    identity: @solution[:identity],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Sync.V1.DocumentPermissionContext #{context}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Sync.V1.DocumentPermissionContext #{context}>"
              end
            end

            class DocumentPermissionInstance < InstanceResource
              ##
              # Initialize the DocumentPermissionInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] service_sid The SID of the {Sync
              #   Service}[https://www.twilio.com/docs/sync/api/service] the resource is
              #   associated with.
              # @param [String] document_sid The SID of the Sync Document to which the Document
              #   Permission applies.
              # @param [String] identity The application-defined string that uniquely identifies
              #   the User's Document Permission resource to fetch.
              # @return [DocumentPermissionInstance] DocumentPermissionInstance
              def initialize(version, payload, service_sid: nil, document_sid: nil, identity: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'service_sid' => payload['service_sid'],
                    'document_sid' => payload['document_sid'],
                    'identity' => payload['identity'],
                    'read' => payload['read'],
                    'write' => payload['write'],
                    'manage' => payload['manage'],
                    'url' => payload['url'],
                }

                # Context
                @instance_context = nil
                @params = {
                    'service_sid' => service_sid,
                    'document_sid' => document_sid,
                    'identity' => identity || @properties['identity'],
                }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [DocumentPermissionContext] DocumentPermissionContext for this DocumentPermissionInstance
              def context
                unless @instance_context
                  @instance_context = DocumentPermissionContext.new(
                      @version,
                      @params['service_sid'],
                      @params['document_sid'],
                      @params['identity'],
                  )
                end
                @instance_context
              end

              ##
              # @return [String] The SID of the Account that created the resource
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] The SID of the Sync Service that the resource is associated with
              def service_sid
                @properties['service_sid']
              end

              ##
              # @return [String] The Sync Document SID
              def document_sid
                @properties['document_sid']
              end

              ##
              # @return [String] The identity of the user to whom the Sync Document Permission applies
              def identity
                @properties['identity']
              end

              ##
              # @return [Boolean] Read access
              def read
                @properties['read']
              end

              ##
              # @return [Boolean] Write access
              def write
                @properties['write']
              end

              ##
              # @return [Boolean] Manage access
              def manage
                @properties['manage']
              end

              ##
              # @return [String] The absolute URL of the Sync Document Permission resource
              def url
                @properties['url']
              end

              ##
              # Fetch the DocumentPermissionInstance
              # @return [DocumentPermissionInstance] Fetched DocumentPermissionInstance
              def fetch
                context.fetch
              end

              ##
              # Delete the DocumentPermissionInstance
              # @return [Boolean] true if delete succeeds, false otherwise
              def delete
                context.delete
              end

              ##
              # Update the DocumentPermissionInstance
              # @param [Boolean] read Whether the identity can read the Sync Document. Default
              #   value is `false`.
              # @param [Boolean] write Whether the identity can update the Sync Document.
              #   Default value is `false`.
              # @param [Boolean] manage Whether the identity can delete the Sync Document.
              #   Default value is `false`.
              # @return [DocumentPermissionInstance] Updated DocumentPermissionInstance
              def update(read: nil, write: nil, manage: nil)
                context.update(read: read, write: write, manage: manage, )
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Sync.V1.DocumentPermissionInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Sync.V1.DocumentPermissionInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end
