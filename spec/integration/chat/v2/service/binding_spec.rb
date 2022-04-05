##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Binding' do
  it "can read" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.chat.v2.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                     .bindings.list()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://chat.twilio.com/v2/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Bindings',
    ))).to eq(true)
  end

  it "receives read_full responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Bindings?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Bindings?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "bindings"
          },
          "bindings": [
              {
                  "sid": "BSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_created": "2016-10-21T11:37:03Z",
                  "date_updated": "2016-10-21T11:37:03Z",
                  "endpoint": "TestUser-endpoint",
                  "identity": "TestUser",
                  "binding_type": "gcm",
                  "credential_sid": "CRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "message_types": [
                      "removed_from_channel",
                      "new_message",
                      "added_to_channel",
                      "invited_to_channel"
                  ],
                  "url": "https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Bindings/BSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "links": {
                      "user": "https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Users/TestUser"
                  }
              }
          ]
      }
      ]
    ))

    actual = @client.chat.v2.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                            .bindings.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Bindings?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Bindings?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "bindings"
          },
          "bindings": []
      }
      ]
    ))

    actual = @client.chat.v2.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                            .bindings.list()

    expect(actual).to_not eq(nil)
  end

  it "can fetch" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.chat.v2.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                     .bindings('BSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://chat.twilio.com/v2/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Bindings/BSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "sid": "BSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2016-10-21T11:37:03Z",
          "date_updated": "2016-10-21T11:37:03Z",
          "endpoint": "TestUser-endpoint",
          "identity": "TestUser",
          "binding_type": "gcm",
          "credential_sid": "CRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "message_types": [
              "removed_from_channel",
              "new_message",
              "added_to_channel",
              "invited_to_channel"
          ],
          "url": "https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Bindings/BSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "user": "https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Users/TestUser"
          }
      }
      ]
    ))

    actual = @client.chat.v2.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                            .bindings('BSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.chat.v2.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                     .bindings('BSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://chat.twilio.com/v2/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Bindings/BSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Textgrid::Response.new(
        204,
      nil,
    ))

    actual = @client.chat.v2.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                            .bindings('BSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end
end
