##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Channel' do
  it "can read" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.flex_api.v1.channel.list()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://flex-api2.textgrid.com/v1/Channels',
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
              "first_page_url": "https://flex-api2.textgrid.com/v1/Channels?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://flex-api2.textgrid.com/v1/Channels?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "flex_chat_channels"
          },
          "flex_chat_channels": [
              {
                  "flex_flow_sid": "FOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "task_sid": "WTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "user_sid": "USaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_created": "2016-08-01T22:10:40Z",
                  "date_updated": "2016-08-01T22:10:40Z",
                  "url": "https://flex-api2.textgrid.com/v1/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              }
          ]
      }
      ]
    ))

    actual = @client.flex_api.v1.channel.list()

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
              "first_page_url": "https://flex-api2.textgrid.com/v1/Channels?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://flex-api2.textgrid.com/v1/Channels?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "flex_chat_channels"
          },
          "flex_chat_channels": []
      }
      ]
    ))

    actual = @client.flex_api.v1.channel.list()

    expect(actual).to_not eq(nil)
  end

  it "can fetch" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.flex_api.v1.channel('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://flex-api2.textgrid.com/v1/Channels/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "flex_flow_sid": "FOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "task_sid": "WTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "user_sid": "USaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2016-08-01T22:10:40Z",
          "date_updated": "2016-08-01T22:10:40Z",
          "url": "https://flex-api2.textgrid.com/v1/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.flex_api.v1.channel('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can create" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.flex_api.v1.channel.create(flex_flow_sid: 'FOXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', identity: 'identity', chat_user_friendly_name: 'chat_user_friendly_name', chat_friendly_name: 'chat_friendly_name')
    }.to raise_exception(Textgrid::REST::TwilioError)

    values = {
        'FlexFlowSid' => 'FOXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
        'Identity' => 'identity',
        'ChatUserFriendlyName' => 'chat_user_friendly_name',
        'ChatFriendlyName' => 'chat_friendly_name',
    }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://flex-api2.textgrid.com/v1/Channels',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Textgrid::Response.new(
        201,
      %q[
      {
          "flex_flow_sid": "FOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "task_sid": "WTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "user_sid": "USaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2016-08-01T22:10:40Z",
          "date_updated": "2016-08-01T22:10:40Z",
          "url": "https://flex-api2.textgrid.com/v1/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.flex_api.v1.channel.create(flex_flow_sid: 'FOXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', identity: 'identity', chat_user_friendly_name: 'chat_user_friendly_name', chat_friendly_name: 'chat_friendly_name')

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.flex_api.v1.channel('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://flex-api2.textgrid.com/v1/Channels/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Textgrid::Response.new(
        204,
      nil,
    ))

    actual = @client.flex_api.v1.channel('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end
end
