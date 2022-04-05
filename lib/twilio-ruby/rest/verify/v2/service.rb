##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Textgrid
  module REST
    class Verify < Domain
      class V2 < Version
        class ServiceList < ListResource
          ##
          # Initialize the ServiceList
          # @param [Version] version Version that contains the resource
          # @return [ServiceList] ServiceList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Services"
          end

          ##
          # Create the ServiceInstance
          # @param [String] friendly_name A descriptive string that you create to describe
          #   the verification service. It can be up to 30 characters long. **This value
          #   should not contain PII.**
          # @param [String] code_length The length of the verification code to generate.
          #   Must be an integer value between 4 and 10, inclusive.
          # @param [Boolean] lookup_enabled Whether to perform a lookup with each
          #   verification started and return info about the phone number.
          # @param [Boolean] skip_sms_to_landlines Whether to skip sending SMS verifications
          #   to landlines. Requires `lookup_enabled`.
          # @param [Boolean] dtmf_input_required Whether to ask the user to press a number
          #   before delivering the verify code in a phone call.
          # @param [String] tts_name The name of an alternative text-to-speech service to
          #   use in phone calls. Applies only to TTS languages.
          # @param [Boolean] psd2_enabled Whether to pass PSD2 transaction parameters when
          #   starting a verification.
          # @param [Boolean] do_not_share_warning_enabled Whether to add a security warning
          #   at the end of an SMS verification body. Disabled by default and applies only to
          #   SMS. Example SMS body: `Your AppName verification code is: 1234. Don’t share
          #   this code with anyone; our employees will never ask for the code`
          # @param [Boolean] custom_code_enabled Whether to allow sending verifications with
          #   a custom code instead of a randomly generated one. Not available for all
          #   customers.
          # @param [Boolean] push_include_date Optional configuration for the Push factors.
          #   If true, include the date in the Challenge's reponse. Otherwise, the date is
          #   omitted from the response. See
          #   {Challenge}[https://www.twilio.com/docs/verify/api/challenge] resource’s details
          #   parameter for more info. Default: true
          # @param [String] push_apn_credential_sid Optional configuration for the Push
          #   factors. Set the APN Credential for this service. This will allow to send push
          #   notifications to iOS devices. See {Credential
          #   Resource}[https://www.twilio.com/docs/notify/api/credential-resource]
          # @param [String] push_fcm_credential_sid Optional configuration for the Push
          #   factors. Set the FCM Credential for this service. This will allow to send push
          #   notifications to Android devices. See {Credential
          #   Resource}[https://www.twilio.com/docs/notify/api/credential-resource]
          # @param [String] totp_issuer Optional configuration for the TOTP factors. Set
          #   TOTP Issuer for this service. This will allow to configure the issuer of the
          #   TOTP URI. Defaults to the service friendly name if not provided.
          # @param [String] totp_time_step Optional configuration for the TOTP factors.
          #   Defines how often, in seconds, are TOTP codes generated. i.e, a new TOTP code is
          #   generated every time_step seconds. Must be between 20 and 60 seconds, inclusive.
          #   Defaults to 30 seconds
          # @param [String] totp_code_length Optional configuration for the TOTP factors.
          #   Number of digits for generated TOTP codes. Must be between 3 and 8, inclusive.
          #   Defaults to 6
          # @param [String] totp_skew Optional configuration for the TOTP factors. The
          #   number of time-steps, past and future, that are valid for validation of TOTP
          #   codes. Must be between 0 and 2, inclusive. Defaults to 1
          # @param [String] default_template_sid The default message
          #   {template}[https://www.twilio.com/docs/verify/api/templates]. Will be used for
          #   all SMS verifications unless explicitly overriden. SMS channel only.
          # @return [ServiceInstance] Created ServiceInstance
          def create(friendly_name: nil, code_length: :unset, lookup_enabled: :unset, skip_sms_to_landlines: :unset, dtmf_input_required: :unset, tts_name: :unset, psd2_enabled: :unset, do_not_share_warning_enabled: :unset, custom_code_enabled: :unset, push_include_date: :unset, push_apn_credential_sid: :unset, push_fcm_credential_sid: :unset, totp_issuer: :unset, totp_time_step: :unset, totp_code_length: :unset, totp_skew: :unset, default_template_sid: :unset)
            data = Textgrid::Values.of({
                'FriendlyName' => friendly_name,
                'CodeLength' => code_length,
                'LookupEnabled' => lookup_enabled,
                'SkipSmsToLandlines' => skip_sms_to_landlines,
                'DtmfInputRequired' => dtmf_input_required,
                'TtsName' => tts_name,
                'Psd2Enabled' => psd2_enabled,
                'DoNotShareWarningEnabled' => do_not_share_warning_enabled,
                'CustomCodeEnabled' => custom_code_enabled,
                'Push.IncludeDate' => push_include_date,
                'Push.ApnCredentialSid' => push_apn_credential_sid,
                'Push.FcmCredentialSid' => push_fcm_credential_sid,
                'Totp.Issuer' => totp_issuer,
                'Totp.TimeStep' => totp_time_step,
                'Totp.CodeLength' => totp_code_length,
                'Totp.Skew' => totp_skew,
                'DefaultTemplateSid' => default_template_sid,
            })

            payload = @version.create('POST', @uri, data: data)

            ServiceInstance.new(@version, payload, )
          end

          ##
          # Lists ServiceInstance records from the API as a list.
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
          # Streams ServiceInstance records from the API as an Enumerable.
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
          # When passed a block, yields ServiceInstance records from the API.
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
          # Retrieve a single page of ServiceInstance records from the API.
          # Request is executed immediately.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of ServiceInstance
          def page(page_token: :unset, page_number: :unset, page_size: :unset)
            params = Textgrid::Values.of({
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            })

            response = @version.page('GET', @uri, params: params)

            ServicePage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of ServiceInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of ServiceInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            ServicePage.new(@version, response, @solution)
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Verify.V2.ServiceList>'
          end
        end

        class ServicePage < Page
          ##
          # Initialize the ServicePage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [ServicePage] ServicePage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of ServiceInstance
          # @param [Hash] payload Payload response from the API
          # @return [ServiceInstance] ServiceInstance
          def get_instance(payload)
            ServiceInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Verify.V2.ServicePage>'
          end
        end

        class ServiceContext < InstanceContext
          ##
          # Initialize the ServiceContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The Twilio-provided string that uniquely identifies the
          #   Verification Service resource to fetch.
          # @return [ServiceContext] ServiceContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {sid: sid, }
            @uri = "/Services/#{@solution[:sid]}"

            # Dependents
            @verifications = nil
            @verification_checks = nil
            @rate_limits = nil
            @messaging_configurations = nil
            @entities = nil
            @webhooks = nil
            @access_tokens = nil
          end

          ##
          # Fetch the ServiceInstance
          # @return [ServiceInstance] Fetched ServiceInstance
          def fetch
            payload = @version.fetch('GET', @uri)

            ServiceInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Delete the ServiceInstance
          # @return [Boolean] true if delete succeeds, false otherwise
          def delete
             @version.delete('DELETE', @uri)
          end

          ##
          # Update the ServiceInstance
          # @param [String] friendly_name A descriptive string that you create to describe
          #   the verification service. It can be up to 30 characters long. **This value
          #   should not contain PII.**
          # @param [String] code_length The length of the verification code to generate.
          #   Must be an integer value between 4 and 10, inclusive.
          # @param [Boolean] lookup_enabled Whether to perform a lookup with each
          #   verification started and return info about the phone number.
          # @param [Boolean] skip_sms_to_landlines Whether to skip sending SMS verifications
          #   to landlines. Requires `lookup_enabled`.
          # @param [Boolean] dtmf_input_required Whether to ask the user to press a number
          #   before delivering the verify code in a phone call.
          # @param [String] tts_name The name of an alternative text-to-speech service to
          #   use in phone calls. Applies only to TTS languages.
          # @param [Boolean] psd2_enabled Whether to pass PSD2 transaction parameters when
          #   starting a verification.
          # @param [Boolean] do_not_share_warning_enabled Whether to add a privacy warning
          #   at the end of an SMS. **Disabled by default and applies only for SMS.**
          # @param [Boolean] custom_code_enabled Whether to allow sending verifications with
          #   a custom code instead of a randomly generated one. Not available for all
          #   customers.
          # @param [Boolean] push_include_date Optional configuration for the Push factors.
          #   If true, include the date in the Challenge's reponse. Otherwise, the date is
          #   omitted from the response. See
          #   {Challenge}[https://www.twilio.com/docs/verify/api/challenge] resource’s details
          #   parameter for more info. Default: true
          # @param [String] push_apn_credential_sid Optional configuration for the Push
          #   factors. Set the APN Credential for this service. This will allow to send push
          #   notifications to iOS devices. See {Credential
          #   Resource}[https://www.twilio.com/docs/notify/api/credential-resource]
          # @param [String] push_fcm_credential_sid Optional configuration for the Push
          #   factors. Set the FCM Credential for this service. This will allow to send push
          #   notifications to Android devices. See {Credential
          #   Resource}[https://www.twilio.com/docs/notify/api/credential-resource]
          # @param [String] totp_issuer Optional configuration for the TOTP factors. Set
          #   TOTP Issuer for this service. This will allow to configure the issuer of the
          #   TOTP URI.
          # @param [String] totp_time_step Optional configuration for the TOTP factors.
          #   Defines how often, in seconds, are TOTP codes generated. i.e, a new TOTP code is
          #   generated every time_step seconds. Must be between 20 and 60 seconds, inclusive.
          #   Defaults to 30 seconds
          # @param [String] totp_code_length Optional configuration for the TOTP factors.
          #   Number of digits for generated TOTP codes. Must be between 3 and 8, inclusive.
          #   Defaults to 6
          # @param [String] totp_skew Optional configuration for the TOTP factors. The
          #   number of time-steps, past and future, that are valid for validation of TOTP
          #   codes. Must be between 0 and 2, inclusive. Defaults to 1
          # @param [String] default_template_sid The default message
          #   {template}[https://www.twilio.com/docs/verify/api/templates]. Will be used for
          #   all SMS verifications unless explicitly overriden. SMS channel only.
          # @return [ServiceInstance] Updated ServiceInstance
          def update(friendly_name: :unset, code_length: :unset, lookup_enabled: :unset, skip_sms_to_landlines: :unset, dtmf_input_required: :unset, tts_name: :unset, psd2_enabled: :unset, do_not_share_warning_enabled: :unset, custom_code_enabled: :unset, push_include_date: :unset, push_apn_credential_sid: :unset, push_fcm_credential_sid: :unset, totp_issuer: :unset, totp_time_step: :unset, totp_code_length: :unset, totp_skew: :unset, default_template_sid: :unset)
            data = Textgrid::Values.of({
                'FriendlyName' => friendly_name,
                'CodeLength' => code_length,
                'LookupEnabled' => lookup_enabled,
                'SkipSmsToLandlines' => skip_sms_to_landlines,
                'DtmfInputRequired' => dtmf_input_required,
                'TtsName' => tts_name,
                'Psd2Enabled' => psd2_enabled,
                'DoNotShareWarningEnabled' => do_not_share_warning_enabled,
                'CustomCodeEnabled' => custom_code_enabled,
                'Push.IncludeDate' => push_include_date,
                'Push.ApnCredentialSid' => push_apn_credential_sid,
                'Push.FcmCredentialSid' => push_fcm_credential_sid,
                'Totp.Issuer' => totp_issuer,
                'Totp.TimeStep' => totp_time_step,
                'Totp.CodeLength' => totp_code_length,
                'Totp.Skew' => totp_skew,
                'DefaultTemplateSid' => default_template_sid,
            })

            payload = @version.update('POST', @uri, data: data)

            ServiceInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Access the verifications
          # @return [VerificationList]
          # @return [VerificationContext] if sid was passed.
          def verifications(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return VerificationContext.new(@version, @solution[:sid], sid, )
            end

            unless @verifications
              @verifications = VerificationList.new(@version, service_sid: @solution[:sid], )
            end

            @verifications
          end

          ##
          # Access the verification_checks
          # @return [VerificationCheckList]
          # @return [VerificationCheckContext]
          def verification_checks
            unless @verification_checks
              @verification_checks = VerificationCheckList.new(@version, service_sid: @solution[:sid], )
            end

            @verification_checks
          end

          ##
          # Access the rate_limits
          # @return [RateLimitList]
          # @return [RateLimitContext] if sid was passed.
          def rate_limits(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return RateLimitContext.new(@version, @solution[:sid], sid, )
            end

            unless @rate_limits
              @rate_limits = RateLimitList.new(@version, service_sid: @solution[:sid], )
            end

            @rate_limits
          end

          ##
          # Access the messaging_configurations
          # @return [MessagingConfigurationList]
          # @return [MessagingConfigurationContext] if country was passed.
          def messaging_configurations(country=:unset)
            raise ArgumentError, 'country cannot be nil' if country.nil?

            if country != :unset
              return MessagingConfigurationContext.new(@version, @solution[:sid], country, )
            end

            unless @messaging_configurations
              @messaging_configurations = MessagingConfigurationList.new(@version, service_sid: @solution[:sid], )
            end

            @messaging_configurations
          end

          ##
          # Access the entities
          # @return [EntityList]
          # @return [EntityContext] if identity was passed.
          def entities(identity=:unset)
            raise ArgumentError, 'identity cannot be nil' if identity.nil?

            if identity != :unset
              return EntityContext.new(@version, @solution[:sid], identity, )
            end

            unless @entities
              @entities = EntityList.new(@version, service_sid: @solution[:sid], )
            end

            @entities
          end

          ##
          # Access the webhooks
          # @return [WebhookList]
          # @return [WebhookContext] if sid was passed.
          def webhooks(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return WebhookContext.new(@version, @solution[:sid], sid, )
            end

            unless @webhooks
              @webhooks = WebhookList.new(@version, service_sid: @solution[:sid], )
            end

            @webhooks
          end

          ##
          # Access the access_tokens
          # @return [AccessTokenList]
          # @return [AccessTokenContext] if sid was passed.
          def access_tokens(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return AccessTokenContext.new(@version, @solution[:sid], sid, )
            end

            unless @access_tokens
              @access_tokens = AccessTokenList.new(@version, service_sid: @solution[:sid], )
            end

            @access_tokens
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Verify.V2.ServiceContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Verify.V2.ServiceContext #{context}>"
          end
        end

        class ServiceInstance < InstanceResource
          ##
          # Initialize the ServiceInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The Twilio-provided string that uniquely identifies the
          #   Verification Service resource to fetch.
          # @return [ServiceInstance] ServiceInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'sid' => payload['sid'],
                'account_sid' => payload['account_sid'],
                'friendly_name' => payload['friendly_name'],
                'code_length' => payload['code_length'].to_i,
                'lookup_enabled' => payload['lookup_enabled'],
                'psd2_enabled' => payload['psd2_enabled'],
                'skip_sms_to_landlines' => payload['skip_sms_to_landlines'],
                'dtmf_input_required' => payload['dtmf_input_required'],
                'tts_name' => payload['tts_name'],
                'do_not_share_warning_enabled' => payload['do_not_share_warning_enabled'],
                'custom_code_enabled' => payload['custom_code_enabled'],
                'push' => payload['push'],
                'totp' => payload['totp'],
                'default_template_sid' => payload['default_template_sid'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                'url' => payload['url'],
                'links' => payload['links'],
            }

            # Context
            @instance_context = nil
            @params = {'sid' => sid || @properties['sid'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [ServiceContext] ServiceContext for this ServiceInstance
          def context
            unless @instance_context
              @instance_context = ServiceContext.new(@version, @params['sid'], )
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
          # @return [String] The string that you assigned to describe the verification service
          def friendly_name
            @properties['friendly_name']
          end

          ##
          # @return [String] The length of the verification code
          def code_length
            @properties['code_length']
          end

          ##
          # @return [Boolean] Whether to perform a lookup with each verification
          def lookup_enabled
            @properties['lookup_enabled']
          end

          ##
          # @return [Boolean] Whether to pass PSD2 transaction parameters when starting a verification
          def psd2_enabled
            @properties['psd2_enabled']
          end

          ##
          # @return [Boolean] Whether to skip sending SMS verifications to landlines
          def skip_sms_to_landlines
            @properties['skip_sms_to_landlines']
          end

          ##
          # @return [Boolean] Whether to ask the user to press a number before delivering the verify code in a phone call
          def dtmf_input_required
            @properties['dtmf_input_required']
          end

          ##
          # @return [String] The name of an alternative text-to-speech service to use in phone calls
          def tts_name
            @properties['tts_name']
          end

          ##
          # @return [Boolean] Whether to add a security warning at the end of an SMS.
          def do_not_share_warning_enabled
            @properties['do_not_share_warning_enabled']
          end

          ##
          # @return [Boolean] Whether to allow sending verifications with a custom code.
          def custom_code_enabled
            @properties['custom_code_enabled']
          end

          ##
          # @return [Hash] The service level configuration of factor push type.
          def push
            @properties['push']
          end

          ##
          # @return [Hash] The service level configuration of factor TOTP type.
          def totp
            @properties['totp']
          end

          ##
          # @return [String] The default_template_sid
          def default_template_sid
            @properties['default_template_sid']
          end

          ##
          # @return [Time] The RFC 2822 date and time in GMT when the resource was created
          def date_created
            @properties['date_created']
          end

          ##
          # @return [Time] The RFC 2822 date and time in GMT when the resource was last updated
          def date_updated
            @properties['date_updated']
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
          # Fetch the ServiceInstance
          # @return [ServiceInstance] Fetched ServiceInstance
          def fetch
            context.fetch
          end

          ##
          # Delete the ServiceInstance
          # @return [Boolean] true if delete succeeds, false otherwise
          def delete
            context.delete
          end

          ##
          # Update the ServiceInstance
          # @param [String] friendly_name A descriptive string that you create to describe
          #   the verification service. It can be up to 30 characters long. **This value
          #   should not contain PII.**
          # @param [String] code_length The length of the verification code to generate.
          #   Must be an integer value between 4 and 10, inclusive.
          # @param [Boolean] lookup_enabled Whether to perform a lookup with each
          #   verification started and return info about the phone number.
          # @param [Boolean] skip_sms_to_landlines Whether to skip sending SMS verifications
          #   to landlines. Requires `lookup_enabled`.
          # @param [Boolean] dtmf_input_required Whether to ask the user to press a number
          #   before delivering the verify code in a phone call.
          # @param [String] tts_name The name of an alternative text-to-speech service to
          #   use in phone calls. Applies only to TTS languages.
          # @param [Boolean] psd2_enabled Whether to pass PSD2 transaction parameters when
          #   starting a verification.
          # @param [Boolean] do_not_share_warning_enabled Whether to add a privacy warning
          #   at the end of an SMS. **Disabled by default and applies only for SMS.**
          # @param [Boolean] custom_code_enabled Whether to allow sending verifications with
          #   a custom code instead of a randomly generated one. Not available for all
          #   customers.
          # @param [Boolean] push_include_date Optional configuration for the Push factors.
          #   If true, include the date in the Challenge's reponse. Otherwise, the date is
          #   omitted from the response. See
          #   {Challenge}[https://www.twilio.com/docs/verify/api/challenge] resource’s details
          #   parameter for more info. Default: true
          # @param [String] push_apn_credential_sid Optional configuration for the Push
          #   factors. Set the APN Credential for this service. This will allow to send push
          #   notifications to iOS devices. See {Credential
          #   Resource}[https://www.twilio.com/docs/notify/api/credential-resource]
          # @param [String] push_fcm_credential_sid Optional configuration for the Push
          #   factors. Set the FCM Credential for this service. This will allow to send push
          #   notifications to Android devices. See {Credential
          #   Resource}[https://www.twilio.com/docs/notify/api/credential-resource]
          # @param [String] totp_issuer Optional configuration for the TOTP factors. Set
          #   TOTP Issuer for this service. This will allow to configure the issuer of the
          #   TOTP URI.
          # @param [String] totp_time_step Optional configuration for the TOTP factors.
          #   Defines how often, in seconds, are TOTP codes generated. i.e, a new TOTP code is
          #   generated every time_step seconds. Must be between 20 and 60 seconds, inclusive.
          #   Defaults to 30 seconds
          # @param [String] totp_code_length Optional configuration for the TOTP factors.
          #   Number of digits for generated TOTP codes. Must be between 3 and 8, inclusive.
          #   Defaults to 6
          # @param [String] totp_skew Optional configuration for the TOTP factors. The
          #   number of time-steps, past and future, that are valid for validation of TOTP
          #   codes. Must be between 0 and 2, inclusive. Defaults to 1
          # @param [String] default_template_sid The default message
          #   {template}[https://www.twilio.com/docs/verify/api/templates]. Will be used for
          #   all SMS verifications unless explicitly overriden. SMS channel only.
          # @return [ServiceInstance] Updated ServiceInstance
          def update(friendly_name: :unset, code_length: :unset, lookup_enabled: :unset, skip_sms_to_landlines: :unset, dtmf_input_required: :unset, tts_name: :unset, psd2_enabled: :unset, do_not_share_warning_enabled: :unset, custom_code_enabled: :unset, push_include_date: :unset, push_apn_credential_sid: :unset, push_fcm_credential_sid: :unset, totp_issuer: :unset, totp_time_step: :unset, totp_code_length: :unset, totp_skew: :unset, default_template_sid: :unset)
            context.update(
                friendly_name: friendly_name,
                code_length: code_length,
                lookup_enabled: lookup_enabled,
                skip_sms_to_landlines: skip_sms_to_landlines,
                dtmf_input_required: dtmf_input_required,
                tts_name: tts_name,
                psd2_enabled: psd2_enabled,
                do_not_share_warning_enabled: do_not_share_warning_enabled,
                custom_code_enabled: custom_code_enabled,
                push_include_date: push_include_date,
                push_apn_credential_sid: push_apn_credential_sid,
                push_fcm_credential_sid: push_fcm_credential_sid,
                totp_issuer: totp_issuer,
                totp_time_step: totp_time_step,
                totp_code_length: totp_code_length,
                totp_skew: totp_skew,
                default_template_sid: default_template_sid,
            )
          end

          ##
          # Access the verifications
          # @return [verifications] verifications
          def verifications
            context.verifications
          end

          ##
          # Access the verification_checks
          # @return [verification_checks] verification_checks
          def verification_checks
            context.verification_checks
          end

          ##
          # Access the rate_limits
          # @return [rate_limits] rate_limits
          def rate_limits
            context.rate_limits
          end

          ##
          # Access the messaging_configurations
          # @return [messaging_configurations] messaging_configurations
          def messaging_configurations
            context.messaging_configurations
          end

          ##
          # Access the entities
          # @return [entities] entities
          def entities
            context.entities
          end

          ##
          # Access the webhooks
          # @return [webhooks] webhooks
          def webhooks
            context.webhooks
          end

          ##
          # Access the access_tokens
          # @return [access_tokens] access_tokens
          def access_tokens
            context.access_tokens
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Verify.V2.ServiceInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Verify.V2.ServiceInstance #{values}>"
          end
        end
      end
    end
  end
end
