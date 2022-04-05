##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'OutgoingCallerId' do
  it "can fetch" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .outgoing_caller_ids('PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://api2.textgrid.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/OutgoingCallerIds/PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.json',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "(415) 867-5309",
          "phone_number": "+141586753096",
          "date_created": "Fri, 21 Aug 2009 00:11:24 +0000",
          "date_updated": "Fri, 21 Aug 2009 00:11:24 +0000",
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/OutgoingCallerIds/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .outgoing_caller_ids('PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .outgoing_caller_ids('PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://api2.textgrid.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/OutgoingCallerIds/PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.json',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "Fri, 21 Aug 2009 00:11:24 +0000",
          "date_updated": "Fri, 21 Aug 2009 00:11:24 +0000",
          "friendly_name": "friendly_name",
          "phone_number": "+141586753096",
          "sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/OutgoingCallerIds/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .outgoing_caller_ids('PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .outgoing_caller_ids('PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://api2.textgrid.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/OutgoingCallerIds/PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.json',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Textgrid::Response.new(
        204,
      nil,
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .outgoing_caller_ids('PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end

  it "can read" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .outgoing_caller_ids.list()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://api2.textgrid.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/OutgoingCallerIds.json',
    ))).to eq(true)
  end

  it "receives read_full responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "end": 0,
          "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/OutgoingCallerIds.json?PageSize=50&Page=0",
          "next_page_uri": null,
          "outgoing_caller_ids": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_created": "Fri, 21 Aug 2009 00:11:24 +0000",
                  "date_updated": "Fri, 21 Aug 2009 00:11:24 +0000",
                  "friendly_name": "(415) 867-5309",
                  "phone_number": "+141586753096",
                  "sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/OutgoingCallerIds/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
              }
          ],
          "page": 0,
          "page_size": 50,
          "previous_page_uri": null,
          "start": 0,
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/OutgoingCallerIds.json?PageSize=50&Page=0"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .outgoing_caller_ids.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "end": 0,
          "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/OutgoingCallerIds.json?PageSize=50&Page=0",
          "next_page_uri": null,
          "outgoing_caller_ids": [],
          "page": 0,
          "page_size": 50,
          "previous_page_uri": null,
          "start": 0,
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/OutgoingCallerIds.json?PageSize=50&Page=0"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .outgoing_caller_ids.list()

    expect(actual).to_not eq(nil)
  end
end
