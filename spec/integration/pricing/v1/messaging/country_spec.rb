##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Country' do
  it "can read" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.pricing.v1.messaging \
                        .countries.list()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://pricing.twilio.com/v1/Messaging/Countries',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "countries": [],
          "meta": {
              "first_page_url": "https://pricing.twilio.com/v1/Messaging/Countries?PageSize=50&Page=0",
              "key": "countries",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://pricing.twilio.com/v1/Messaging/Countries?PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.pricing.v1.messaging \
                               .countries.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_full responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "countries": [
              {
                  "country": "country",
                  "iso_country": "US",
                  "url": "https://pricing.twilio.com/v1/Messaging/Countries/US"
              }
          ],
          "meta": {
              "first_page_url": "https://pricing.twilio.com/v1/Messaging/Countries?PageSize=50&Page=0",
              "key": "countries",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://pricing.twilio.com/v1/Messaging/Countries?PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.pricing.v1.messaging \
                               .countries.list()

    expect(actual).to_not eq(nil)
  end

  it "can fetch" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.pricing.v1.messaging \
                        .countries('US').fetch()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://pricing.twilio.com/v1/Messaging/Countries/US',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "country": "country",
          "inbound_sms_prices": [
              {
                  "base_price": "0.05",
                  "current_price": "0.05",
                  "number_type": "mobile"
              }
          ],
          "iso_country": "US",
          "outbound_sms_prices": [
              {
                  "carrier": "att",
                  "mcc": "foo",
                  "mnc": "bar",
                  "prices": [
                      {
                          "base_price": "0.05",
                          "current_price": "0.05",
                          "number_type": "mobile"
                      }
                  ]
              }
          ],
          "price_unit": "USD",
          "url": "https://pricing.twilio.com/v1/Messaging/Countries/US"
      }
      ]
    ))

    actual = @client.pricing.v1.messaging \
                               .countries('US').fetch()

    expect(actual).to_not eq(nil)
  end
end
