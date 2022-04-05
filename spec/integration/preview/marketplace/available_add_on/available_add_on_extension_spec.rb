##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'AvailableAddOnExtension' do
  it "can fetch" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.preview.marketplace.available_add_ons('XBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                 .extensions('XFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://preview.twilio.com/marketplace/AvailableAddOns/XBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Extensions/XFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "sid": "XFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "available_add_on_sid": "XBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "Incoming Voice Call",
          "product_name": "Programmable Voice",
          "unique_name": "voice-incoming",
          "url": "https://preview.twilio.com/marketplace/AvailableAddOns/XBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Extensions/XFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.preview.marketplace.available_add_ons('XBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                        .extensions('XFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.preview.marketplace.available_add_ons('XBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                 .extensions.list()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://preview.twilio.com/marketplace/AvailableAddOns/XBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Extensions',
    ))).to eq(true)
  end

  it "receives read_full responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "extensions": [
              {
                  "sid": "XFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "available_add_on_sid": "XBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "friendly_name": "Incoming Voice Call",
                  "product_name": "Programmable Voice",
                  "unique_name": "voice-incoming",
                  "url": "https://preview.twilio.com/marketplace/AvailableAddOns/XBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Extensions/XFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              }
          ],
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://preview.twilio.com/marketplace/AvailableAddOns/XBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Extensions?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://preview.twilio.com/marketplace/AvailableAddOns/XBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Extensions?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "extensions"
          }
      }
      ]
    ))

    actual = @client.preview.marketplace.available_add_ons('XBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                        .extensions.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "extensions": [],
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://preview.twilio.com/marketplace/AvailableAddOns/XBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Extensions?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://preview.twilio.com/marketplace/AvailableAddOns/XBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Extensions?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "extensions"
          }
      }
      ]
    ))

    actual = @client.preview.marketplace.available_add_ons('XBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                        .extensions.list()

    expect(actual).to_not eq(nil)
  end
end
