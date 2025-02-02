##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Day' do
  it "can fetch" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.bulkexports.v1.exports('resource_type') \
                            .days('day').fetch()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://bulkexports.twilio.com/v1/Exports/resource_type/Days/day',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "redirect_to": "https://www.twilio.com"
      }
      ]
    ))

    actual = @client.bulkexports.v1.exports('resource_type') \
                                   .days('day').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.bulkexports.v1.exports('resource_type') \
                            .days.list()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://bulkexports.twilio.com/v1/Exports/resource_type/Days',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "days": [],
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://bulkexports.twilio.com/v1/Exports/Messages/Days?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://bulkexports.twilio.com/v1/Exports/Messages/Days?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "days"
          }
      }
      ]
    ))

    actual = @client.bulkexports.v1.exports('resource_type') \
                                   .days.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_full responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "days": [
              {
                  "day": "2017-04-01",
                  "size": 100,
                  "resource_type": "Messages",
                  "create_date": "2017-04-02",
                  "friendly_name": "friendly_name"
              }
          ],
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://bulkexports.twilio.com/v1/Exports/Messages/Days?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://bulkexports.twilio.com/v1/Exports/Messages/Days?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "days"
          }
      }
      ]
    ))

    actual = @client.bulkexports.v1.exports('resource_type') \
                                   .days.list()

    expect(actual).to_not eq(nil)
  end
end
