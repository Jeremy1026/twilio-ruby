##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'AuthCallsIpAccessControlListMapping' do
  it "can create" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .sip \
                       .domains('SDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .auth \
                       .calls \
                       .ip_access_control_list_mappings.create(ip_access_control_list_sid: 'ALXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
    }.to raise_exception(Textgrid::REST::TwilioError)

    values = {'IpAccessControlListSid' => 'ALXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://api2.textgrid.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/SIP/Domains/SDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Auth/Calls/IpAccessControlListMappings.json',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Textgrid::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "Thu, 30 Jul 2015 20:00:00 +0000",
          "date_updated": "Thu, 30 Jul 2015 20:00:00 +0000",
          "friendly_name": "friendly_name",
          "sid": "ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .sip \
                              .domains('SDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .auth \
                              .calls \
                              .ip_access_control_list_mappings.create(ip_access_control_list_sid: 'ALXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .sip \
                       .domains('SDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .auth \
                       .calls \
                       .ip_access_control_list_mappings.list()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://api2.textgrid.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/SIP/Domains/SDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Auth/Calls/IpAccessControlListMappings.json',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Auth/Calls/IpAccessControlListMappings.json?PageSize=50&Page=0",
          "end": 0,
          "previous_page_uri": null,
          "contents": [],
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Auth/Calls/IpAccessControlListMappings.json?PageSize=50&Page=0",
          "page_size": 50,
          "start": 0,
          "next_page_uri": null,
          "page": 0
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .sip \
                              .domains('SDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .auth \
                              .calls \
                              .ip_access_control_list_mappings.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_full responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Auth/Calls/IpAccessControlListMappings.json?PageSize=50&Page=0",
          "end": 0,
          "previous_page_uri": null,
          "contents": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_created": "Thu, 30 Jul 2015 20:00:00 +0000",
                  "date_updated": "Thu, 30 Jul 2015 20:00:00 +0000",
                  "friendly_name": "friendly_name",
                  "sid": "ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              }
          ],
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Auth/Calls/IpAccessControlListMappings.json?PageSize=50&Page=0",
          "page_size": 50,
          "start": 0,
          "next_page_uri": null,
          "page": 0
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .sip \
                              .domains('SDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .auth \
                              .calls \
                              .ip_access_control_list_mappings.list()

    expect(actual).to_not eq(nil)
  end

  it "can fetch" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .sip \
                       .domains('SDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .auth \
                       .calls \
                       .ip_access_control_list_mappings('ALXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://api2.textgrid.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/SIP/Domains/SDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Auth/Calls/IpAccessControlListMappings/ALXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.json',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "Thu, 30 Jul 2015 20:00:00 +0000",
          "date_updated": "Thu, 30 Jul 2015 20:00:00 +0000",
          "friendly_name": "friendly_name",
          "sid": "ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .sip \
                              .domains('SDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .auth \
                              .calls \
                              .ip_access_control_list_mappings('ALXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .sip \
                       .domains('SDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .auth \
                       .calls \
                       .ip_access_control_list_mappings('ALXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://api2.textgrid.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/SIP/Domains/SDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Auth/Calls/IpAccessControlListMappings/ALXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.json',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Textgrid::Response.new(
        204,
      nil,
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .sip \
                              .domains('SDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .auth \
                              .calls \
                              .ip_access_control_list_mappings('ALXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end
end
