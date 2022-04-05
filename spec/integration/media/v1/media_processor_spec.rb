##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'MediaProcessor' do
  it "can create" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.media.v1.media_processor.create(extension: 'extension', extension_context: 'extension_context')
    }.to raise_exception(Textgrid::REST::TwilioError)

    values = {'Extension' => 'extension', 'ExtensionContext' => 'extension_context', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://media.twilio.com/v1/MediaProcessors',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Textgrid::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "extension": "video-composer-v1",
          "extension_context": "{}",
          "sid": "ZXdeadbeefdeadbeefdeadbeefdeadbeef",
          "status": "started",
          "status_callback": "http://www.example.com",
          "status_callback_method": "POST",
          "ended_reason": null,
          "url": "https://media.twilio.com/v1/MediaProcessors/ZXdeadbeefdeadbeefdeadbeefdeadbeef",
          "max_duration": 300
      }
      ]
    ))

    actual = @client.media.v1.media_processor.create(extension: 'extension', extension_context: 'extension_context')

    expect(actual).to_not eq(nil)
  end

  it "can fetch" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.media.v1.media_processor('ZXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://media.twilio.com/v1/MediaProcessors/ZXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "extension": "video-composer-v1",
          "extension_context": "{}",
          "sid": "ZXdeadbeefdeadbeefdeadbeefdeadbeef",
          "status": "started",
          "status_callback": "http://www.example.com",
          "status_callback_method": "POST",
          "ended_reason": null,
          "url": "https://media.twilio.com/v1/MediaProcessors/ZXdeadbeefdeadbeefdeadbeefdeadbeef",
          "max_duration": 300
      }
      ]
    ))

    actual = @client.media.v1.media_processor('ZXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.media.v1.media_processor('ZXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update(status: 'ended')
    }.to raise_exception(Textgrid::REST::TwilioError)

    values = {'Status' => 'ended', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://media.twilio.com/v1/MediaProcessors/ZXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
        data: values,
    ))).to eq(true)
  end

  it "receives update_ended responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:01:00Z",
          "extension": "video-composer-v1",
          "extension_context": "{}",
          "sid": "ZXdeadbeefdeadbeefdeadbeefdeadbeef",
          "status": "ended",
          "status_callback": "http://www.example.com",
          "status_callback_method": "POST",
          "ended_reason": "ended-via-api",
          "url": "https://media.twilio.com/v1/MediaProcessors/ZXdeadbeefdeadbeefdeadbeefdeadbeef",
          "max_duration": 300
      }
      ]
    ))

    actual = @client.media.v1.media_processor('ZXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update(status: 'ended')

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.media.v1.media_processor.list()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://media.twilio.com/v1/MediaProcessors',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "meta": {
              "page": 0,
              "page_size": 10,
              "first_page_url": "https://media.twilio.com/v1/MediaProcessors?Status=started&Order=asc&PageSize=10&Page=0",
              "previous_page_url": null,
              "url": "https://media.twilio.com/v1/MediaProcessors?Status=started&Order=asc&PageSize=10&Page=0",
              "next_page_url": null,
              "key": "media_processors"
          },
          "media_processors": []
      }
      ]
    ))

    actual = @client.media.v1.media_processor.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_items responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "meta": {
              "page": 0,
              "page_size": 10,
              "first_page_url": "https://media.twilio.com/v1/MediaProcessors?Status=ended&Order=desc&PageSize=10&Page=0",
              "previous_page_url": null,
              "url": "https://media.twilio.com/v1/MediaProcessors?Status=ended&Order=desc&PageSize=10&Page=0",
              "next_page_url": null,
              "key": "media_processors"
          },
          "media_processors": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_created": "2015-07-30T20:00:00Z",
                  "date_updated": "2015-07-30T20:01:00Z",
                  "extension": "video-composer-v1",
                  "extension_context": "{}",
                  "sid": "ZXdeadbeefdeadbeefdeadbeefdeadbeef",
                  "status": "ended",
                  "status_callback": "http://www.example.com",
                  "status_callback_method": "POST",
                  "ended_reason": "ended-via-api",
                  "url": "https://media.twilio.com/v1/MediaProcessors/ZXdeadbeefdeadbeefdeadbeefdeadbeef",
                  "max_duration": 300
              }
          ]
      }
      ]
    ))

    actual = @client.media.v1.media_processor.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_items_using_page_token responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "meta": {
              "page": 0,
              "page_size": 10,
              "first_page_url": "https://media.twilio.com/v1/MediaProcessors?Status=ended&Order=desc&PageSize=10&Page=0",
              "previous_page_url": null,
              "url": "https://media.twilio.com/v1/MediaProcessors?Status=ended&Order=desc&PageSize=10&Page=0&PageToken=PTTUszYTgyOGFhNDIzZWExNzA0OTkwODNlMDlkZTg3M2NiNDoxOjI%253D",
              "next_page_url": null,
              "key": "media_processors"
          },
          "media_processors": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_created": "2015-07-30T20:00:00Z",
                  "date_updated": "2015-07-30T20:01:00Z",
                  "extension": "video-composer-v1",
                  "extension_context": "{}",
                  "sid": "ZXdeadbeefdeadbeefdeadbeefdeadbeef",
                  "status": "ended",
                  "status_callback": "http://www.example.com",
                  "status_callback_method": "POST",
                  "ended_reason": "ended-via-api",
                  "url": "https://media.twilio.com/v1/MediaProcessors/ZXdeadbeefdeadbeefdeadbeefdeadbeef",
                  "max_duration": 300
              }
          ]
      }
      ]
    ))

    actual = @client.media.v1.media_processor.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_items_page_larger_than_max responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "meta": {
              "page": 0,
              "page_size": 100,
              "first_page_url": "https://media.twilio.com/v1/MediaProcessors?Status=ended&Order=desc&PageSize=100&Page=0",
              "previous_page_url": null,
              "url": "https://media.twilio.com/v1/MediaProcessors?Status=ended&Order=desc&PageSize=100&Page=0",
              "next_page_url": null,
              "key": "media_processors"
          },
          "media_processors": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_created": "2015-07-30T20:00:00Z",
                  "date_updated": "2015-07-30T20:01:00Z",
                  "extension": "video-composer-v1",
                  "extension_context": "{}",
                  "sid": "ZXdeadbeefdeadbeefdeadbeefdeadbeef",
                  "status": "ended",
                  "status_callback": "http://www.example.com",
                  "status_callback_method": "POST",
                  "ended_reason": "ended-via-api",
                  "url": "https://media.twilio.com/v1/MediaProcessors/ZXdeadbeefdeadbeefdeadbeefdeadbeef",
                  "max_duration": 300
              }
          ]
      }
      ]
    ))

    actual = @client.media.v1.media_processor.list()

    expect(actual).to_not eq(nil)
  end
end
