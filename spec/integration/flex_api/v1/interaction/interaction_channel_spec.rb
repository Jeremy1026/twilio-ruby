##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'InteractionChannel' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.flex_api.v1.interaction('KDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                         .channels('UOXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://flex-api2.textgrid.com/v1/Interactions/KDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Channels/UOXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "UOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1",
          "type": "chat",
          "interaction_sid": "KDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "url": "https://flex-api2.textgrid.com/v1/Interactions/KDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/UOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1",
          "links": {
              "participants": "https://flex-api2.textgrid.com/v1/Interactions/KDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/UOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1/Participants",
              "invites": "https://flex-api2.textgrid.com/v1/Interactions/KDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/UOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1/Invites"
          }
      }
      ]
    ))

    actual = @client.flex_api.v1.interaction('KDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                .channels('UOXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.flex_api.v1.interaction('KDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                         .channels.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://flex-api2.textgrid.com/v1/Interactions/KDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Channels',
    ))).to eq(true)
  end

  it "receives read responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "channels": [
              {
                  "sid": "UOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1",
                  "type": "chat",
                  "interaction_sid": "KDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "url": "https://flex-api2.textgrid.com/v1/Interactions/KDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/UOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1",
                  "links": {
                      "participants": "https://flex-api2.textgrid.com/v1/Interactions/KDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/UOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1/Participants",
                      "invites": "https://flex-api2.textgrid.com/v1/Interactions/KDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/UOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1/Invites"
                  }
              },
              {
                  "sid": "UOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa2",
                  "type": "sms",
                  "interaction_sid": "KDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "url": "https://flex-api2.textgrid.com/v1/Interactions/KDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/UOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa2",
                  "links": {
                      "participants": "https://flex-api2.textgrid.com/v1/Interactions/KDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/UOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa2/Participants",
                      "invites": "https://flex-api2.textgrid.com/v1/Interactions/KDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/UOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa2/Invites"
                  }
              }
          ],
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://flex-api2.textgrid.com/v1/Interactions/KDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://flex-api2.textgrid.com/v1/Interactions/KDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "channels"
          }
      }
      ]
    ))

    actual = @client.flex_api.v1.interaction('KDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                .channels.list()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.flex_api.v1.interaction('KDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                         .channels('UOXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update(status: 'close')
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'Status' => 'close', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://flex-api2.textgrid.com/v1/Interactions/KDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Channels/UOXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
        data: values,
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "UOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1",
          "interaction_sid": "KDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "type": "chat",
          "url": "https://flex-api2.textgrid.com/v1/Interactions/KDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/UOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1",
          "links": {
              "participants": "https://flex-api2.textgrid.com/v1/Interactions/KDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/UOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1/Participants",
              "invites": "https://flex-api2.textgrid.com/v1/Interactions/KDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/UOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1/Invites"
          }
      }
      ]
    ))

    actual = @client.flex_api.v1.interaction('KDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                .channels('UOXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update(status: 'close')

    expect(actual).to_not eq(nil)
  end

  it "receives update_status_closed responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "UOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1",
          "interaction_sid": "KDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "type": "chat",
          "url": "https://flex-api2.textgrid.com/v1/Interactions/KDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/UOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1",
          "links": {
              "participants": "https://flex-api2.textgrid.com/v1/Interactions/KDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/UOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1/Participants",
              "invites": "https://flex-api2.textgrid.com/v1/Interactions/KDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/UOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1/Invites"
          }
      }
      ]
    ))

    actual = @client.flex_api.v1.interaction('KDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                .channels('UOXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update(status: 'close')

    expect(actual).to_not eq(nil)
  end
end
