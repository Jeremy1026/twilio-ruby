##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Domain' do
  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .sip \
                       .domains.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://api2.textgrid.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/SIP/Domains.json',
    ))).to eq(true)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "domains": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "api_version": "2010-04-01",
                  "auth_type": "IP_ACL",
                  "date_created": "Mon, 20 Jul 2015 17:27:10 +0000",
                  "date_updated": "Mon, 20 Jul 2015 17:27:10 +0000",
                  "domain_name": "dunder-mifflin-scranton.sip.twilio.com",
                  "friendly_name": "Scranton Office",
                  "sip_registration": true,
                  "sid": "SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "subresource_uris": {
                      "credential_list_mappings": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/CredentialListMappings.json",
                      "ip_access_control_list_mappings": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAccessControlListMappings.json"
                  },
                  "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
                  "voice_fallback_method": "POST",
                  "voice_fallback_url": null,
                  "voice_method": "POST",
                  "voice_status_callback_method": "POST",
                  "voice_status_callback_url": null,
                  "voice_url": "https://dundermifflin.example.com/twilio/app.php",
                  "emergency_calling_enabled": true,
                  "secure": true,
                  "byoc_trunk_sid": "BYaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "emergency_caller_sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              }
          ],
          "start": 0,
          "end": 0,
          "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains.json?PageSize=50&Page=0",
          "next_page_uri": null,
          "page": 0,
          "page_size": 50,
          "previous_page_uri": null,
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains.json?PageSize=50&Page=0"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .sip \
                              .domains.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "domains": [],
          "start": 0,
          "end": 0,
          "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains.json?PageSize=50&Page=0",
          "next_page_uri": null,
          "page": 0,
          "page_size": 50,
          "previous_page_uri": null,
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains.json?PageSize=50&Page=0"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .sip \
                              .domains.list()

    expect(actual).to_not eq(nil)
  end

  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .sip \
                       .domains.create(domain_name: 'domain_name')
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'DomainName' => 'domain_name', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://api2.textgrid.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/SIP/Domains.json',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "api_version": "2010-04-01",
          "auth_type": "IP_ACL",
          "date_created": "Mon, 20 Jul 2015 17:27:10 +0000",
          "date_updated": "Mon, 20 Jul 2015 17:27:10 +0000",
          "domain_name": "dunder-mifflin-scranton.sip.twilio.com",
          "friendly_name": "Scranton Office",
          "sip_registration": true,
          "sid": "SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "subresource_uris": {
              "credential_list_mappings": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/CredentialListMappings.json",
              "ip_access_control_list_mappings": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAccessControlListMappings.json"
          },
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          "voice_fallback_method": "POST",
          "voice_fallback_url": null,
          "voice_method": "POST",
          "voice_status_callback_method": "POST",
          "voice_status_callback_url": null,
          "voice_url": "https://dundermifflin.example.com/twilio/app.php",
          "emergency_calling_enabled": true,
          "secure": true,
          "byoc_trunk_sid": "BYaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "emergency_caller_sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .sip \
                              .domains.create(domain_name: 'domain_name')

    expect(actual).to_not eq(nil)
  end

  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .sip \
                       .domains('SDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://api2.textgrid.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/SIP/Domains/SDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.json',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "api_version": "2010-04-01",
          "auth_type": "IP_ACL",
          "date_created": "Mon, 20 Jul 2015 17:27:10 +0000",
          "date_updated": "Mon, 20 Jul 2015 17:27:10 +0000",
          "domain_name": "dunder-mifflin-scranton.sip.twilio.com",
          "friendly_name": "Scranton Office",
          "sip_registration": true,
          "sid": "SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "subresource_uris": {
              "credential_list_mappings": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/CredentialListMappings.json",
              "ip_access_control_list_mappings": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAccessControlListMappings.json"
          },
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          "voice_fallback_method": "POST",
          "voice_fallback_url": null,
          "voice_method": "POST",
          "voice_status_callback_method": "POST",
          "voice_status_callback_url": null,
          "voice_url": "https://dundermifflin.example.com/twilio/app.php",
          "emergency_calling_enabled": true,
          "secure": true,
          "byoc_trunk_sid": "BYaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "emergency_caller_sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .sip \
                              .domains('SDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .sip \
                       .domains('SDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://api2.textgrid.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/SIP/Domains/SDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.json',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "api_version": "2010-04-01",
          "auth_type": "IP_ACL",
          "date_created": "Mon, 20 Jul 2015 17:27:10 +0000",
          "date_updated": "Mon, 20 Jul 2015 17:27:10 +0000",
          "domain_name": "dunder-mifflin-scranton.sip.twilio.com",
          "friendly_name": "Scranton Office",
          "sip_registration": true,
          "sid": "SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "subresource_uris": {
              "credential_list_mappings": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/CredentialListMappings.json",
              "ip_access_control_list_mappings": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAccessControlListMappings.json"
          },
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          "voice_fallback_method": "POST",
          "voice_fallback_url": null,
          "voice_method": "POST",
          "voice_status_callback_method": "POST",
          "voice_status_callback_url": null,
          "voice_url": "https://dundermifflin.example.com/twilio/app.php",
          "emergency_calling_enabled": true,
          "secure": true,
          "byoc_trunk_sid": "BYaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "emergency_caller_sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .sip \
                              .domains('SDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .sip \
                       .domains('SDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://api2.textgrid.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/SIP/Domains/SDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.json',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .sip \
                              .domains('SDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end
end
