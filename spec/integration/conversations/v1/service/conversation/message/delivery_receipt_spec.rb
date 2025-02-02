##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'DeliveryReceipt' do
  it "can fetch" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.conversations.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .conversations('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .messages('IMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .delivery_receipts('DYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://conversations.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages/IMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Receipts/DYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "sid": "DYaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "chat_service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "conversation_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "message_sid": "IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "channel_message_sid": "SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "status": "failed",
          "error_code": 3000,
          "participant_sid": "MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2016-03-24T20:37:57Z",
          "date_updated": "2016-03-24T20:37:57Z",
          "url": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Receipts/DYaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.conversations.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .conversations('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .messages('IMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .delivery_receipts('DYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.conversations.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .conversations('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .messages('IMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .delivery_receipts.list()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://conversations.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages/IMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Receipts',
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
              "first_page_url": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Receipts?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Receipts?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "delivery_receipts"
          },
          "delivery_receipts": [
              {
                  "sid": "DYaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "chat_service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "conversation_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "message_sid": "IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "channel_message_sid": "SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "status": "failed",
                  "error_code": 3000,
                  "participant_sid": "MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_created": "2016-03-24T20:37:57Z",
                  "date_updated": "2016-03-24T20:37:57Z",
                  "url": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Receipts/DYaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              },
              {
                  "sid": "DYaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "chat_service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "conversation_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "message_sid": "IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "channel_message_sid": "SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "status": "failed",
                  "error_code": 3000,
                  "participant_sid": "MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_created": "2016-03-24T20:37:57Z",
                  "date_updated": "2016-03-24T20:37:57Z",
                  "url": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Receipts/DYaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              },
              {
                  "sid": "DYaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "chat_service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "conversation_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "message_sid": "IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "channel_message_sid": "SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "status": "failed",
                  "error_code": 3000,
                  "participant_sid": "MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_created": "2016-03-24T20:37:57Z",
                  "date_updated": "2016-03-24T20:37:57Z",
                  "url": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Receipts/DYaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              }
          ]
      }
      ]
    ))

    actual = @client.conversations.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .conversations('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .messages('IMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .delivery_receipts.list()

    expect(actual).to_not eq(nil)
  end
end
