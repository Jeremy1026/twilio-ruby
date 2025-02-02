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
          class SipList < ListResource
            class CredentialListContext < InstanceContext
              class CredentialList < ListResource
                ##
                # Initialize the CredentialList
                # @param [Version] version Version that contains the resource
                # @param [String] account_sid The unique id of the Account that is responsible for
                #   this resource.
                # @param [String] credential_list_sid The unique id that identifies the credential
                #   list that includes this credential.
                # @return [CredentialList] CredentialList
                def initialize(version, account_sid: nil, credential_list_sid: nil)
                  super(version)

                  # Path Solution
                  @solution = {account_sid: account_sid, credential_list_sid: credential_list_sid}
                  @uri = "/Accounts/#{@solution[:account_sid]}/SIP/CredentialLists/#{@solution[:credential_list_sid]}/Credentials.json"
                end

                ##
                # Lists CredentialInstance records from the API as a list.
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
                # Streams CredentialInstance records from the API as an Enumerable.
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
                # When passed a block, yields CredentialInstance records from the API.
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
                # Retrieve a single page of CredentialInstance records from the API.
                # Request is executed immediately.
                # @param [String] page_token PageToken provided by the API
                # @param [Integer] page_number Page Number, this value is simply for client state
                # @param [Integer] page_size Number of records to return, defaults to 50
                # @return [Page] Page of CredentialInstance
                def page(page_token: :unset, page_number: :unset, page_size: :unset)
                  params = Textgrid::Values.of({
                      'PageToken' => page_token,
                      'Page' => page_number,
                      'PageSize' => page_size,
                  })

                  response = @version.page('GET', @uri, params: params)

                  CredentialPage.new(@version, response, @solution)
                end

                ##
                # Retrieve a single page of CredentialInstance records from the API.
                # Request is executed immediately.
                # @param [String] target_url API-generated URL for the requested results page
                # @return [Page] Page of CredentialInstance
                def get_page(target_url)
                  response = @version.domain.request(
                      'GET',
                      target_url
                  )
                  CredentialPage.new(@version, response, @solution)
                end

                ##
                # Create the CredentialInstance
                # @param [String] username The username that will be passed when authenticating
                #   SIP requests. The username should be sent in response to Twilio's challenge of
                #   the initial INVITE. It can be up to 32 characters long.
                # @param [String] password The password that the username will use when
                #   authenticating SIP requests. The password must be a minimum of 12 characters,
                #   contain at least 1 digit, and have mixed case. (eg `IWasAtSignal2018`)
                # @return [CredentialInstance] Created CredentialInstance
                def create(username: nil, password: nil)
                  data = Textgrid::Values.of({'Username' => username, 'Password' => password, })

                  payload = @version.create('POST', @uri, data: data)

                  CredentialInstance.new(
                      @version,
                      payload,
                      account_sid: @solution[:account_sid],
                      credential_list_sid: @solution[:credential_list_sid],
                  )
                end

                ##
                # Provide a user friendly representation
                def to_s
                  '#<Twilio.Api.V2010.CredentialList>'
                end
              end

              class CredentialPage < Page
                ##
                # Initialize the CredentialPage
                # @param [Version] version Version that contains the resource
                # @param [Response] response Response from the API
                # @param [Hash] solution Path solution for the resource
                # @return [CredentialPage] CredentialPage
                def initialize(version, response, solution)
                  super(version, response)

                  # Path Solution
                  @solution = solution
                end

                ##
                # Build an instance of CredentialInstance
                # @param [Hash] payload Payload response from the API
                # @return [CredentialInstance] CredentialInstance
                def get_instance(payload)
                  CredentialInstance.new(
                      @version,
                      payload,
                      account_sid: @solution[:account_sid],
                      credential_list_sid: @solution[:credential_list_sid],
                  )
                end

                ##
                # Provide a user friendly representation
                def to_s
                  '<Twilio.Api.V2010.CredentialPage>'
                end
              end

              class CredentialContext < InstanceContext
                ##
                # Initialize the CredentialContext
                # @param [Version] version Version that contains the resource
                # @param [String] account_sid The unique id of the Account that is responsible for
                #   this resource.
                # @param [String] credential_list_sid The unique id that identifies the credential
                #   list that contains the desired credential.
                # @param [String] sid The unique id that identifies the resource to fetch.
                # @return [CredentialContext] CredentialContext
                def initialize(version, account_sid, credential_list_sid, sid)
                  super(version)

                  # Path Solution
                  @solution = {account_sid: account_sid, credential_list_sid: credential_list_sid, sid: sid, }
                  @uri = "/Accounts/#{@solution[:account_sid]}/SIP/CredentialLists/#{@solution[:credential_list_sid]}/Credentials/#{@solution[:sid]}.json"
                end

                ##
                # Fetch the CredentialInstance
                # @return [CredentialInstance] Fetched CredentialInstance
                def fetch
                  payload = @version.fetch('GET', @uri)

                  CredentialInstance.new(
                      @version,
                      payload,
                      account_sid: @solution[:account_sid],
                      credential_list_sid: @solution[:credential_list_sid],
                      sid: @solution[:sid],
                  )
                end

                ##
                # Update the CredentialInstance
                # @param [String] password The password that the username will use when
                #   authenticating SIP requests. The password must be a minimum of 12 characters,
                #   contain at least 1 digit, and have mixed case. (eg `IWasAtSignal2018`)
                # @return [CredentialInstance] Updated CredentialInstance
                def update(password: :unset)
                  data = Textgrid::Values.of({'Password' => password, })

                  payload = @version.update('POST', @uri, data: data)

                  CredentialInstance.new(
                      @version,
                      payload,
                      account_sid: @solution[:account_sid],
                      credential_list_sid: @solution[:credential_list_sid],
                      sid: @solution[:sid],
                  )
                end

                ##
                # Delete the CredentialInstance
                # @return [Boolean] true if delete succeeds, false otherwise
                def delete
                   @version.delete('DELETE', @uri)
                end

                ##
                # Provide a user friendly representation
                def to_s
                  context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                  "#<Twilio.Api.V2010.CredentialContext #{context}>"
                end

                ##
                # Provide a detailed, user friendly representation
                def inspect
                  context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                  "#<Twilio.Api.V2010.CredentialContext #{context}>"
                end
              end

              class CredentialInstance < InstanceResource
                ##
                # Initialize the CredentialInstance
                # @param [Version] version Version that contains the resource
                # @param [Hash] payload payload that contains response from Twilio
                # @param [String] account_sid The unique id of the Account that is responsible for
                #   this resource.
                # @param [String] credential_list_sid The unique id that identifies the credential
                #   list that includes this credential.
                # @param [String] sid The unique id that identifies the resource to fetch.
                # @return [CredentialInstance] CredentialInstance
                def initialize(version, payload, account_sid: nil, credential_list_sid: nil, sid: nil)
                  super(version)

                  # Marshaled Properties
                  @properties = {
                      'sid' => payload['sid'],
                      'account_sid' => payload['account_sid'],
                      'credential_list_sid' => payload['credential_list_sid'],
                      'username' => payload['username'],
                      'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                      'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                      'uri' => payload['uri'],
                  }

                  # Context
                  @instance_context = nil
                  @params = {
                      'account_sid' => account_sid,
                      'credential_list_sid' => credential_list_sid,
                      'sid' => sid || @properties['sid'],
                  }
                end

                ##
                # Generate an instance context for the instance, the context is capable of
                # performing various actions.  All instance actions are proxied to the context
                # @return [CredentialContext] CredentialContext for this CredentialInstance
                def context
                  unless @instance_context
                    @instance_context = CredentialContext.new(
                        @version,
                        @params['account_sid'],
                        @params['credential_list_sid'],
                        @params['sid'],
                    )
                  end
                  @instance_context
                end

                ##
                # @return [String] A 34 character string that uniquely identifies this resource.
                def sid
                  @properties['sid']
                end

                ##
                # @return [String] The unique id of the Account that is responsible for this resource.
                def account_sid
                  @properties['account_sid']
                end

                ##
                # @return [String] The unique id that identifies the credential list that includes this credential
                def credential_list_sid
                  @properties['credential_list_sid']
                end

                ##
                # @return [String] The username for this credential.
                def username
                  @properties['username']
                end

                ##
                # @return [Time] The date that this resource was created, given as GMT in RFC 2822 format.
                def date_created
                  @properties['date_created']
                end

                ##
                # @return [Time] The date that this resource was last updated, given as GMT in RFC 2822 format.
                def date_updated
                  @properties['date_updated']
                end

                ##
                # @return [String] The URI for this resource, relative to https://api2.textgrid.com
                def uri
                  @properties['uri']
                end

                ##
                # Fetch the CredentialInstance
                # @return [CredentialInstance] Fetched CredentialInstance
                def fetch
                  context.fetch
                end

                ##
                # Update the CredentialInstance
                # @param [String] password The password that the username will use when
                #   authenticating SIP requests. The password must be a minimum of 12 characters,
                #   contain at least 1 digit, and have mixed case. (eg `IWasAtSignal2018`)
                # @return [CredentialInstance] Updated CredentialInstance
                def update(password: :unset)
                  context.update(password: password, )
                end

                ##
                # Delete the CredentialInstance
                # @return [Boolean] true if delete succeeds, false otherwise
                def delete
                  context.delete
                end

                ##
                # Provide a user friendly representation
                def to_s
                  values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                  "<Twilio.Api.V2010.CredentialInstance #{values}>"
                end

                ##
                # Provide a detailed, user friendly representation
                def inspect
                  values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                  "<Twilio.Api.V2010.CredentialInstance #{values}>"
                end
              end
            end
          end
        end
      end
    end
  end
end
