##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Participant' do
  it "can create" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.conversations.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .conversations('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .participants.create(x_twilio_webhook_enabled: 'true')
    }.to raise_exception(Textgrid::REST::TwilioError)

    headers = {'X-Twilio-Webhook-Enabled' => 'true', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://conversations.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants',
        headers: headers,
    ))).to eq(true)
  end

  it "receives create_sms responses" do
    @holodeck.mock(Textgrid::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "chat_service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "conversation_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "identity": "null",
          "attributes": "{ \\"role\\": \\"driver\\" }",
          "messaging_binding": {
              "type": "sms",
              "address": "+15558675310",
              "proxy_address": "+15017122661"
          },
          "role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-12-16T22:18:37Z",
          "date_updated": "2015-12-16T22:18:38Z",
          "url": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "last_read_message_index": null,
          "last_read_timestamp": null
      }
      ]
    ))

    actual = @client.conversations.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .conversations('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .participants.create()

    expect(actual).to_not eq(nil)
  end

  it "receives create_chat responses" do
    @holodeck.mock(Textgrid::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "chat_service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "conversation_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "identity": "IDENTITY",
          "attributes": "{ \\"role\\": \\"driver\\" }",
          "messaging_binding": null,
          "role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-12-16T22:18:37Z",
          "date_updated": "2015-12-16T22:18:38Z",
          "url": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "last_read_message_index": null,
          "last_read_timestamp": null
      }
      ]
    ))

    actual = @client.conversations.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .conversations('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .participants.create()

    expect(actual).to_not eq(nil)
  end

  it "receives create_gmms responses" do
    @holodeck.mock(Textgrid::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "chat_service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "conversation_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "identity": "IDENTITY",
          "attributes": "{ \\"role\\": \\"driver\\" }",
          "messaging_binding": {
              "type": "sms",
              "projected_address": "+15017122661"
          },
          "role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-12-16T22:18:37Z",
          "date_updated": "2015-12-16T22:18:38Z",
          "url": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "last_read_message_index": null,
          "last_read_timestamp": null
      }
      ]
    ))

    actual = @client.conversations.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .conversations('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .participants.create()

    expect(actual).to_not eq(nil)
  end

  it "receives create_gmms_chat_no_attributes responses" do
    @holodeck.mock(Textgrid::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "chat_service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "conversation_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "identity": "IDENTITY",
          "attributes": "{}",
          "messaging_binding": {
              "type": "sms",
              "projected_address": "+15017122661"
          },
          "role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2020-07-01T22:18:37Z",
          "date_updated": "2020-07-01T22:18:37Z",
          "url": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "last_read_message_index": null,
          "last_read_timestamp": null
      }
      ]
    ))

    actual = @client.conversations.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .conversations('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .participants.create()

    expect(actual).to_not eq(nil)
  end

  it "receives create_gmms_sms_no_attributes responses" do
    @holodeck.mock(Textgrid::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "chat_service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "conversation_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "identity": null,
          "attributes": "{}",
          "messaging_binding": {
              "type": "sms",
              "address": "+15017122661"
          },
          "role_sid": null,
          "date_created": "2020-07-01T22:18:37Z",
          "date_updated": "2020-07-01T22:18:37Z",
          "url": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "last_read_message_index": null,
          "last_read_timestamp": null
      }
      ]
    ))

    actual = @client.conversations.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .conversations('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .participants.create()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.conversations.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .conversations('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .participants('MBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update(x_twilio_webhook_enabled: 'true')
    }.to raise_exception(Textgrid::REST::TwilioError)

    headers = {'X-Twilio-Webhook-Enabled' => 'true', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://conversations.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants/MBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
        headers: headers,
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "chat_service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "conversation_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "identity": null,
          "attributes": "{ \\"role\\": \\"driver\\" }",
          "messaging_binding": {
              "type": "sms",
              "address": "+15558675310",
              "proxy_address": "+15017122661"
          },
          "role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-12-16T22:18:37Z",
          "date_updated": "2015-12-16T22:18:38Z",
          "url": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "last_read_message_index": null,
          "last_read_timestamp": null
      }
      ]
    ))

    actual = @client.conversations.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .conversations('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .participants('MBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end

  it "receives update_gmms responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "chat_service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "conversation_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "identity": "id",
          "attributes": "{ \\"role\\": \\"driver\\" }",
          "messaging_binding": {
              "type": "sms",
              "projected_address": "+15017122661"
          },
          "role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-12-16T22:18:37Z",
          "date_updated": "2015-12-16T22:18:38Z",
          "url": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "last_read_message_index": null,
          "last_read_timestamp": null
      }
      ]
    ))

    actual = @client.conversations.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .conversations('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .participants('MBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.conversations.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .conversations('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .participants('MBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete(x_twilio_webhook_enabled: 'true')
    }.to raise_exception(Textgrid::REST::TwilioError)

    headers = {'X-Twilio-Webhook-Enabled' => 'true', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://conversations.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants/MBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
        headers: headers,
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Textgrid::Response.new(
        204,
      nil,
    ))

    actual = @client.conversations.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .conversations('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .participants('MBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end

  it "can fetch" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.conversations.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .conversations('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .participants('MBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://conversations.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants/MBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "chat_service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "conversation_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "identity": null,
          "attributes": "{ \\"role\\": \\"driver\\" }",
          "messaging_binding": {
              "type": "sms",
              "address": "+15558675310",
              "proxy_address": "+15017122661"
          },
          "role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2016-03-24T21:05:50Z",
          "date_updated": "2016-03-24T21:05:50Z",
          "url": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "last_read_message_index": null,
          "last_read_timestamp": null
      }
      ]
    ))

    actual = @client.conversations.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .conversations('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .participants('MBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.conversations.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .conversations('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .participants.list()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://conversations.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants',
    ))).to eq(true)
  end

  it "receives read responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "participants"
          },
          "participants": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "chat_service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "conversation_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "sid": "MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "identity": null,
                  "attributes": "{ \\"role\\": \\"driver\\" }",
                  "messaging_binding": {
                      "type": "sms",
                      "address": "+15558675310",
                      "proxy_address": "+15017122661"
                  },
                  "role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_created": "2016-03-24T21:05:50Z",
                  "date_updated": "2016-03-24T21:05:50Z",
                  "url": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "last_read_message_index": null,
                  "last_read_timestamp": null
              },
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "chat_service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "conversation_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "sid": "MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "identity": "IDENTITY",
                  "attributes": "{ \\"role\\": \\"driver\\" }",
                  "messaging_binding": null,
                  "role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_created": "2016-03-24T21:05:50Z",
                  "date_updated": "2016-03-24T21:05:50Z",
                  "url": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "last_read_message_index": null,
                  "last_read_timestamp": null
              }
          ]
      }
      ]
    ))

    actual = @client.conversations.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .conversations('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .participants.list()

    expect(actual).to_not eq(nil)
  end
end
