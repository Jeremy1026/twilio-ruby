##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Service' do
  it "can fetch" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://sync.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "friendly_name": "friendly_name",
          "links": {
              "documents": "https://sync.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Documents",
              "lists": "https://sync.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Lists",
              "maps": "https://sync.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Maps",
              "streams": "https://sync.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Streams"
          },
          "sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "unique_name": "unique_name",
          "url": "https://sync.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "webhook_url": "http://www.example.com",
          "webhooks_from_rest_enabled": false,
          "reachability_webhooks_enabled": false,
          "acl_enabled": false,
          "reachability_debouncing_enabled": false,
          "reachability_debouncing_window": 5000
      }
      ]
    ))

    actual = @client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://sync.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Textgrid::Response.new(
        204,
      nil,
    ))

    actual = @client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end

  it "can create" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.sync.v1.services.create()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://sync.twilio.com/v1/Services',
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Textgrid::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "friendly_name": "friendly_name",
          "links": {
              "documents": "https://sync.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Documents",
              "lists": "https://sync.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Lists",
              "maps": "https://sync.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Maps",
              "streams": "https://sync.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Streams"
          },
          "sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "unique_name": "unique_name",
          "url": "https://sync.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "webhook_url": "http://www.example.com",
          "webhooks_from_rest_enabled": false,
          "reachability_webhooks_enabled": false,
          "acl_enabled": true,
          "reachability_debouncing_enabled": false,
          "reachability_debouncing_window": 5000
      }
      ]
    ))

    actual = @client.sync.v1.services.create()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.sync.v1.services.list()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://sync.twilio.com/v1/Services',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "meta": {
              "first_page_url": "https://sync.twilio.com/v1/Services?PageSize=50&Page=0",
              "key": "services",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://sync.twilio.com/v1/Services?PageSize=50&Page=0"
          },
          "services": []
      }
      ]
    ))

    actual = @client.sync.v1.services.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_full responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "meta": {
              "first_page_url": "https://sync.twilio.com/v1/Services?PageSize=50&Page=0",
              "key": "services",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://sync.twilio.com/v1/Services?PageSize=50&Page=0"
          },
          "services": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_created": "2015-07-30T20:00:00Z",
                  "date_updated": "2015-07-30T20:00:00Z",
                  "friendly_name": "friendly_name",
                  "links": {
                      "documents": "https://sync.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Documents",
                      "lists": "https://sync.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Lists",
                      "maps": "https://sync.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Maps",
                      "streams": "https://sync.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Streams"
                  },
                  "sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "unique_name": "unique_name",
                  "url": "https://sync.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "webhook_url": "http://www.example.com",
                  "webhooks_from_rest_enabled": false,
                  "reachability_webhooks_enabled": false,
                  "acl_enabled": false,
                  "reachability_debouncing_enabled": false,
                  "reachability_debouncing_window": 5000
              }
          ]
      }
      ]
    ))

    actual = @client.sync.v1.services.list()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://sync.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "friendly_name": "friendly_name",
          "links": {
              "documents": "https://sync.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Documents",
              "lists": "https://sync.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Lists",
              "maps": "https://sync.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Maps",
              "streams": "https://sync.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Streams"
          },
          "sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "unique_name": "unique_name",
          "url": "https://sync.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "webhook_url": "http://www.example.com",
          "webhooks_from_rest_enabled": false,
          "reachability_webhooks_enabled": false,
          "acl_enabled": true,
          "reachability_debouncing_enabled": false,
          "reachability_debouncing_window": 5000
      }
      ]
    ))

    actual = @client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end
end
