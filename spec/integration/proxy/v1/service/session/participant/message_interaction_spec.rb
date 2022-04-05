##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'MessageInteraction' do
  it "can create" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.proxy.v1.services('KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                      .sessions('KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                      .participants('KPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                      .message_interactions.create()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://proxy.twilio.com/v1/Services/KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Sessions/KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants/KPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/MessageInteractions',
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Textgrid::Response.new(
        201,
      %q[
      {
          "service_sid": "KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "data": "{\\"body\\":\\"some message\\"}",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "participant_sid": "KPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "inbound_participant_sid": null,
          "inbound_resource_sid": null,
          "inbound_resource_status": null,
          "inbound_resource_type": null,
          "inbound_resource_url": null,
          "outbound_participant_sid": "KPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "outbound_resource_sid": "SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "outbound_resource_status": "sent",
          "outbound_resource_type": "Message",
          "outbound_resource_url": null,
          "sid": "KIaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "type": "message",
          "url": "https://proxy.twilio.com/v1/Services/KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Sessions/KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/KPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/MessageInteractions/KIaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "session_sid": "KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.proxy.v1.services('KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .sessions('KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .participants('KPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .message_interactions.create()

    expect(actual).to_not eq(nil)
  end

  it "can fetch" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.proxy.v1.services('KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                      .sessions('KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                      .participants('KPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                      .message_interactions('KIXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://proxy.twilio.com/v1/Services/KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Sessions/KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants/KPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/MessageInteractions/KIXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "service_sid": "KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "data": "{\\"body\\":\\"some message\\"}",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "participant_sid": "KPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "inbound_participant_sid": null,
          "inbound_resource_sid": null,
          "inbound_resource_status": null,
          "inbound_resource_type": null,
          "inbound_resource_url": null,
          "outbound_participant_sid": "KPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "outbound_resource_sid": "SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "outbound_resource_status": "sent",
          "outbound_resource_type": "Message",
          "outbound_resource_url": null,
          "sid": "KIaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "type": "message",
          "url": "https://proxy.twilio.com/v1/Services/KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Sessions/KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/KPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/MessageInteractions/KIaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "session_sid": "KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.proxy.v1.services('KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .sessions('KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .participants('KPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .message_interactions('KIXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.proxy.v1.services('KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                      .sessions('KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                      .participants('KPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                      .message_interactions.list()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://proxy.twilio.com/v1/Services/KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Sessions/KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants/KPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/MessageInteractions',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "interactions": [],
          "meta": {
              "previous_page_url": null,
              "next_page_url": null,
              "url": "https://proxy.twilio.com/v1/Services/KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Sessions/KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/KPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/MessageInteractions?PageSize=50&Page=0",
              "page": 0,
              "first_page_url": "https://proxy.twilio.com/v1/Services/KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Sessions/KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/KPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/MessageInteractions?PageSize=50&Page=0",
              "page_size": 50,
              "key": "interactions"
          }
      }
      ]
    ))

    actual = @client.proxy.v1.services('KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .sessions('KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .participants('KPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .message_interactions.list()

    expect(actual).to_not eq(nil)
  end
end
