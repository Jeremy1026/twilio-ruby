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
          class AddressList < ListResource
            ##
            # Initialize the AddressList
            # @param [Version] version Version that contains the resource
            # @param [String] account_sid The SID of the
            #   {Account}[https://www.twilio.com/docs/iam/api/account] that is responsible for
            #   the Address resource.
            # @return [AddressList] AddressList
            def initialize(version, account_sid: nil)
              super(version)

              # Path Solution
              @solution = {account_sid: account_sid}
              @uri = "/Accounts/#{@solution[:account_sid]}/Addresses.json"
            end

            ##
            # Create the AddressInstance
            # @param [String] customer_name The name to associate with the new address.
            # @param [String] street The number and street address of the new address.
            # @param [String] city The city of the new address.
            # @param [String] region The state or region of the new address.
            # @param [String] postal_code The postal code of the new address.
            # @param [String] iso_country The ISO country code of the new address.
            # @param [String] friendly_name A descriptive string that you create to describe
            #   the new address. It can be up to 64 characters long.
            # @param [Boolean] emergency_enabled Whether to enable emergency calling on the
            #   new address. Can be: `true` or `false`.
            # @param [Boolean] auto_correct_address Whether we should automatically correct
            #   the address. Can be: `true` or `false` and the default is `true`. If empty or
            #   `true`, we will correct the address you provide if necessary. If `false`, we
            #   won't alter the address you provide.
            # @return [AddressInstance] Created AddressInstance
            def create(customer_name: nil, street: nil, city: nil, region: nil, postal_code: nil, iso_country: nil, friendly_name: :unset, emergency_enabled: :unset, auto_correct_address: :unset)
              data = Textgrid::Values.of({
                  'CustomerName' => customer_name,
                  'Street' => street,
                  'City' => city,
                  'Region' => region,
                  'PostalCode' => postal_code,
                  'IsoCountry' => iso_country,
                  'FriendlyName' => friendly_name,
                  'EmergencyEnabled' => emergency_enabled,
                  'AutoCorrectAddress' => auto_correct_address,
              })

              payload = @version.create('POST', @uri, data: data)

              AddressInstance.new(@version, payload, account_sid: @solution[:account_sid], )
            end

            ##
            # Lists AddressInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [String] customer_name The `customer_name` of the Address resources to
            #   read.
            # @param [String] friendly_name The string that identifies the Address resources
            #   to read.
            # @param [String] iso_country The ISO country code of the Address resources to
            #   read.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(customer_name: :unset, friendly_name: :unset, iso_country: :unset, limit: nil, page_size: nil)
              self.stream(
                  customer_name: customer_name,
                  friendly_name: friendly_name,
                  iso_country: iso_country,
                  limit: limit,
                  page_size: page_size
              ).entries
            end

            ##
            # Streams AddressInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [String] customer_name The `customer_name` of the Address resources to
            #   read.
            # @param [String] friendly_name The string that identifies the Address resources
            #   to read.
            # @param [String] iso_country The ISO country code of the Address resources to
            #   read.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(customer_name: :unset, friendly_name: :unset, iso_country: :unset, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(
                  customer_name: customer_name,
                  friendly_name: friendly_name,
                  iso_country: iso_country,
                  page_size: limits[:page_size],
              )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields AddressInstance records from the API.
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
            # Retrieve a single page of AddressInstance records from the API.
            # Request is executed immediately.
            # @param [String] customer_name The `customer_name` of the Address resources to
            #   read.
            # @param [String] friendly_name The string that identifies the Address resources
            #   to read.
            # @param [String] iso_country The ISO country code of the Address resources to
            #   read.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of AddressInstance
            def page(customer_name: :unset, friendly_name: :unset, iso_country: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
              params = Textgrid::Values.of({
                  'CustomerName' => customer_name,
                  'FriendlyName' => friendly_name,
                  'IsoCountry' => iso_country,
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })

              response = @version.page('GET', @uri, params: params)

              AddressPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of AddressInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of AddressInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              AddressPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Api.V2010.AddressList>'
            end
          end

          class AddressPage < Page
            ##
            # Initialize the AddressPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [AddressPage] AddressPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of AddressInstance
            # @param [Hash] payload Payload response from the API
            # @return [AddressInstance] AddressInstance
            def get_instance(payload)
              AddressInstance.new(@version, payload, account_sid: @solution[:account_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Api.V2010.AddressPage>'
            end
          end

          class AddressContext < InstanceContext
            ##
            # Initialize the AddressContext
            # @param [Version] version Version that contains the resource
            # @param [String] account_sid The SID of the
            #   {Account}[https://www.twilio.com/docs/iam/api/account] that is responsible for
            #   the Address resource to fetch.
            # @param [String] sid The Twilio-provided string that uniquely identifies the
            #   Address resource to fetch.
            # @return [AddressContext] AddressContext
            def initialize(version, account_sid, sid)
              super(version)

              # Path Solution
              @solution = {account_sid: account_sid, sid: sid, }
              @uri = "/Accounts/#{@solution[:account_sid]}/Addresses/#{@solution[:sid]}.json"

              # Dependents
              @dependent_phone_numbers = nil
            end

            ##
            # Delete the AddressInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
               @version.delete('DELETE', @uri)
            end

            ##
            # Fetch the AddressInstance
            # @return [AddressInstance] Fetched AddressInstance
            def fetch
              payload = @version.fetch('GET', @uri)

              AddressInstance.new(@version, payload, account_sid: @solution[:account_sid], sid: @solution[:sid], )
            end

            ##
            # Update the AddressInstance
            # @param [String] friendly_name A descriptive string that you create to describe
            #   the address. It can be up to 64 characters long.
            # @param [String] customer_name The name to associate with the address.
            # @param [String] street The number and street address of the address.
            # @param [String] city The city of the address.
            # @param [String] region The state or region of the address.
            # @param [String] postal_code The postal code of the address.
            # @param [Boolean] emergency_enabled Whether to enable emergency calling on the
            #   address. Can be: `true` or `false`.
            # @param [Boolean] auto_correct_address Whether we should automatically correct
            #   the address. Can be: `true` or `false` and the default is `true`. If empty or
            #   `true`, we will correct the address you provide if necessary. If `false`, we
            #   won't alter the address you provide.
            # @return [AddressInstance] Updated AddressInstance
            def update(friendly_name: :unset, customer_name: :unset, street: :unset, city: :unset, region: :unset, postal_code: :unset, emergency_enabled: :unset, auto_correct_address: :unset)
              data = Textgrid::Values.of({
                  'FriendlyName' => friendly_name,
                  'CustomerName' => customer_name,
                  'Street' => street,
                  'City' => city,
                  'Region' => region,
                  'PostalCode' => postal_code,
                  'EmergencyEnabled' => emergency_enabled,
                  'AutoCorrectAddress' => auto_correct_address,
              })

              payload = @version.update('POST', @uri, data: data)

              AddressInstance.new(@version, payload, account_sid: @solution[:account_sid], sid: @solution[:sid], )
            end

            ##
            # Access the dependent_phone_numbers
            # @return [DependentPhoneNumberList]
            # @return [DependentPhoneNumberContext]
            def dependent_phone_numbers
              unless @dependent_phone_numbers
                @dependent_phone_numbers = DependentPhoneNumberList.new(
                    @version,
                    account_sid: @solution[:account_sid],
                    address_sid: @solution[:sid],
                )
              end

              @dependent_phone_numbers
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Api.V2010.AddressContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Api.V2010.AddressContext #{context}>"
            end
          end

          class AddressInstance < InstanceResource
            ##
            # Initialize the AddressInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] account_sid The SID of the
            #   {Account}[https://www.twilio.com/docs/iam/api/account] that is responsible for
            #   the Address resource.
            # @param [String] sid The Twilio-provided string that uniquely identifies the
            #   Address resource to fetch.
            # @return [AddressInstance] AddressInstance
            def initialize(version, payload, account_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'city' => payload['city'],
                  'customer_name' => payload['customer_name'],
                  'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                  'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                  'friendly_name' => payload['friendly_name'],
                  'iso_country' => payload['iso_country'],
                  'postal_code' => payload['postal_code'],
                  'region' => payload['region'],
                  'sid' => payload['sid'],
                  'street' => payload['street'],
                  'uri' => payload['uri'],
                  'emergency_enabled' => payload['emergency_enabled'],
                  'validated' => payload['validated'],
                  'verified' => payload['verified'],
              }

              # Context
              @instance_context = nil
              @params = {'account_sid' => account_sid, 'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [AddressContext] AddressContext for this AddressInstance
            def context
              unless @instance_context
                @instance_context = AddressContext.new(@version, @params['account_sid'], @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The SID of the Account that is responsible for the resource
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] The city in which the address is located
            def city
              @properties['city']
            end

            ##
            # @return [String] The name associated with the address
            def customer_name
              @properties['customer_name']
            end

            ##
            # @return [Time] The RFC 2822 date and time in GMT that the resource was created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The RFC 2822 date and time in GMT that the resource was last updated
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] The string that you assigned to describe the resource
            def friendly_name
              @properties['friendly_name']
            end

            ##
            # @return [String] The ISO country code of the address
            def iso_country
              @properties['iso_country']
            end

            ##
            # @return [String] The postal code of the address
            def postal_code
              @properties['postal_code']
            end

            ##
            # @return [String] The state or region of the address
            def region
              @properties['region']
            end

            ##
            # @return [String] The unique string that identifies the resource
            def sid
              @properties['sid']
            end

            ##
            # @return [String] The number and street address of the address
            def street
              @properties['street']
            end

            ##
            # @return [String] The URI of the resource, relative to `https://api2.textgrid.com`
            def uri
              @properties['uri']
            end

            ##
            # @return [Boolean] Whether emergency calling has been enabled on this number
            def emergency_enabled
              @properties['emergency_enabled']
            end

            ##
            # @return [Boolean] Whether the address has been validated to comply with local regulation
            def validated
              @properties['validated']
            end

            ##
            # @return [Boolean] Whether the address has been verified to comply with regulation
            def verified
              @properties['verified']
            end

            ##
            # Delete the AddressInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
              context.delete
            end

            ##
            # Fetch the AddressInstance
            # @return [AddressInstance] Fetched AddressInstance
            def fetch
              context.fetch
            end

            ##
            # Update the AddressInstance
            # @param [String] friendly_name A descriptive string that you create to describe
            #   the address. It can be up to 64 characters long.
            # @param [String] customer_name The name to associate with the address.
            # @param [String] street The number and street address of the address.
            # @param [String] city The city of the address.
            # @param [String] region The state or region of the address.
            # @param [String] postal_code The postal code of the address.
            # @param [Boolean] emergency_enabled Whether to enable emergency calling on the
            #   address. Can be: `true` or `false`.
            # @param [Boolean] auto_correct_address Whether we should automatically correct
            #   the address. Can be: `true` or `false` and the default is `true`. If empty or
            #   `true`, we will correct the address you provide if necessary. If `false`, we
            #   won't alter the address you provide.
            # @return [AddressInstance] Updated AddressInstance
            def update(friendly_name: :unset, customer_name: :unset, street: :unset, city: :unset, region: :unset, postal_code: :unset, emergency_enabled: :unset, auto_correct_address: :unset)
              context.update(
                  friendly_name: friendly_name,
                  customer_name: customer_name,
                  street: street,
                  city: city,
                  region: region,
                  postal_code: postal_code,
                  emergency_enabled: emergency_enabled,
                  auto_correct_address: auto_correct_address,
              )
            end

            ##
            # Access the dependent_phone_numbers
            # @return [dependent_phone_numbers] dependent_phone_numbers
            def dependent_phone_numbers
              context.dependent_phone_numbers
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Api.V2010.AddressInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Api.V2010.AddressInstance #{values}>"
            end
          end
        end
      end
    end
  end
end
