##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'SyncListItem' do
  it "can fetch" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                     .sync_lists('ESXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                     .sync_list_items(1).fetch()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://sync.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Lists/ESXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Items/1',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "created_by": "created_by",
          "data": {},
          "date_expires": "2015-07-30T21:00:00Z",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "index": 100,
          "list_sid": "ESaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "revision": "revision",
          "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "url": "https://sync.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Lists/ESaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Items/100"
      }
      ]
    ))

    actual = @client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                            .sync_lists('ESXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                            .sync_list_items(1).fetch()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                     .sync_lists('ESXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                     .sync_list_items(1).delete(if_match: 'if_match')
    }.to raise_exception(Textgrid::REST::TwilioError)

    headers = {'If-Match' => 'if_match', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://sync.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Lists/ESXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Items/1',
        headers: headers,
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Textgrid::Response.new(
        204,
      nil,
    ))

    actual = @client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                            .sync_lists('ESXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                            .sync_list_items(1).delete()

    expect(actual).to eq(true)
  end

  it "can create" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                     .sync_lists('ESXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                     .sync_list_items.create(data: {})
    }.to raise_exception(Textgrid::REST::TwilioError)

    values = {'Data' => Twilio.serialize_object({}), }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://sync.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Lists/ESXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Items',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Textgrid::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "created_by": "created_by",
          "data": {},
          "date_expires": "2015-07-30T21:00:00Z",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "index": 100,
          "list_sid": "ESaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "revision": "revision",
          "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "url": "https://sync.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Lists/ESaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Items/100"
      }
      ]
    ))

    actual = @client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                            .sync_lists('ESXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                            .sync_list_items.create(data: {})

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                     .sync_lists('ESXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                     .sync_list_items.list()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://sync.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Lists/ESXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Items',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "items": [],
          "meta": {
              "first_page_url": "https://sync.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Lists/ESaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Items?From=from&Bounds=inclusive&Order=asc&PageSize=50&Page=0",
              "key": "items",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://sync.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Lists/ESaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Items?From=from&Bounds=inclusive&Order=asc&PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                            .sync_lists('ESXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                            .sync_list_items.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_full responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "items": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "created_by": "created_by",
                  "data": {},
                  "date_expires": "2015-07-30T21:00:00Z",
                  "date_created": "2015-07-30T20:00:00Z",
                  "date_updated": "2015-07-30T20:00:00Z",
                  "index": 100,
                  "list_sid": "ESaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "revision": "revision",
                  "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "url": "https://sync.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Lists/ESaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Items/100"
              }
          ],
          "meta": {
              "first_page_url": "https://sync.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Lists/ESaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Items?From=from&Bounds=inclusive&Order=asc&PageSize=50&Page=0",
              "key": "items",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://sync.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Lists/ESaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Items?From=from&Bounds=inclusive&Order=asc&PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                            .sync_lists('ESXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                            .sync_list_items.list()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                     .sync_lists('ESXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                     .sync_list_items(1).update(if_match: 'if_match')
    }.to raise_exception(Textgrid::REST::TwilioError)

    headers = {'If-Match' => 'if_match', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://sync.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Lists/ESXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Items/1',
        headers: headers,
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "created_by": "created_by",
          "data": {},
          "date_expires": "2015-07-30T21:00:00Z",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "index": 100,
          "list_sid": "ESaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "revision": "revision",
          "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "url": "https://sync.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Lists/ESaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Items/100"
      }
      ]
    ))

    actual = @client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                            .sync_lists('ESXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                            .sync_list_items(1).update()

    expect(actual).to_not eq(nil)
  end
end
