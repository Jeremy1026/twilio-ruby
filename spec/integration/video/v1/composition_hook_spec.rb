##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'CompositionHook' do
  it "can fetch" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.video.v1.composition_hooks('HKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://video.twilio.com/v1/CompositionHooks/HKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "My composition hook",
          "enabled": true,
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:01:33Z",
          "sid": "HKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "audio_sources": [
              "user*"
          ],
          "audio_sources_excluded": [
              "moderator*"
          ],
          "video_layout": {
              "grid": {
                  "video_sources": [
                      "*"
                  ],
                  "video_sources_excluded": [
                      "moderator*"
                  ],
                  "reuse": "show_oldest",
                  "x_pos": 100,
                  "y_pos": 600,
                  "z_pos": 10,
                  "width": 0,
                  "height": 0,
                  "max_columns": 0,
                  "max_rows": 0,
                  "cells_excluded": []
              },
              "pip": {
                  "video_sources": [
                      "student*"
                  ],
                  "video_sources_excluded": [],
                  "reuse": "none",
                  "x_pos": 100,
                  "y_pos": 600,
                  "z_pos": 10,
                  "width": 0,
                  "height": 0,
                  "max_columns": 0,
                  "max_rows": 0,
                  "cells_excluded": []
              }
          },
          "resolution": "1280x720",
          "format": "webm",
          "trim": true,
          "status_callback": "http://www.example.com",
          "status_callback_method": "POST",
          "url": "https://video.twilio.com/v1/CompositionHooks/HKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.video.v1.composition_hooks('HKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.video.v1.composition_hooks.list()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://video.twilio.com/v1/CompositionHooks',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "composition_hooks": [],
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://video.twilio.com/v1/CompositionHooks?Enabled=True&PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://video.twilio.com/v1/CompositionHooks?Enabled=True&PageSize=50&Page=0",
              "next_page_url": null,
              "key": "composition_hooks"
          }
      }
      ]
    ))

    actual = @client.video.v1.composition_hooks.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_results responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "composition_hooks": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "friendly_name": "My Special Hook1",
                  "enabled": true,
                  "date_created": "2015-07-30T20:00:00Z",
                  "date_updated": "2015-07-30T20:01:33Z",
                  "sid": "HKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "audio_sources": [
                      "*"
                  ],
                  "audio_sources_excluded": [],
                  "video_layout": {
                      "grid": {
                          "video_sources": [
                              "*"
                          ],
                          "video_sources_excluded": [
                              "moderator*"
                          ],
                          "reuse": "show_oldest",
                          "x_pos": 100,
                          "y_pos": 600,
                          "z_pos": 10,
                          "width": 0,
                          "height": 0,
                          "max_columns": 0,
                          "max_rows": 0,
                          "cells_excluded": []
                      },
                      "pip": {
                          "video_sources": [
                              "student*"
                          ],
                          "video_sources_excluded": [],
                          "reuse": "none",
                          "x_pos": 100,
                          "y_pos": 600,
                          "z_pos": 10,
                          "width": 0,
                          "height": 0,
                          "max_columns": 0,
                          "max_rows": 0,
                          "cells_excluded": []
                      }
                  },
                  "resolution": "1280x720",
                  "format": "webm",
                  "trim": true,
                  "status_callback": "http://www.example.com",
                  "status_callback_method": "POST",
                  "url": "https://video.twilio.com/v1/CompositionHooks/HKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              }
          ],
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://video.twilio.com/v1/CompositionHooks?FriendlyName=%2AHook%2A&DateCreatedBefore=2017-12-31T23%3A59%3A59Z&DateCreatedAfter=2017-01-01T00%3A00%3A01Z&Enabled=True&PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://video.twilio.com/v1/CompositionHooks?FriendlyName=%2AHook%2A&DateCreatedBefore=2017-12-31T23%3A59%3A59Z&DateCreatedAfter=2017-01-01T00%3A00%3A01Z&Enabled=True&PageSize=50&Page=0",
              "next_page_url": null,
              "key": "composition_hooks"
          }
      }
      ]
    ))

    actual = @client.video.v1.composition_hooks.list()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.video.v1.composition_hooks('HKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://video.twilio.com/v1/CompositionHooks/HKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Textgrid::Response.new(
        204,
      nil,
    ))

    actual = @client.video.v1.composition_hooks('HKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end

  it "can create" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.video.v1.composition_hooks.create(friendly_name: 'friendly_name')
    }.to raise_exception(Textgrid::REST::TwilioError)

    values = {'FriendlyName' => 'friendly_name', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://video.twilio.com/v1/CompositionHooks',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Textgrid::Response.new(
        201,
      %q[
      {
          "friendly_name": "My composition hook",
          "enabled": false,
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": null,
          "sid": "HKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "audio_sources": [
              "user*",
              "moderator"
          ],
          "audio_sources_excluded": [
              "admin"
          ],
          "video_layout": {
              "custom": {
                  "video_sources": [
                      "user*"
                  ],
                  "video_sources_excluded": [
                      "moderator"
                  ],
                  "reuse": "show_oldest",
                  "x_pos": 100,
                  "y_pos": 600,
                  "z_pos": 10,
                  "width": 800,
                  "height": 0,
                  "max_columns": 0,
                  "max_rows": 0,
                  "cells_excluded": [
                      2,
                      3
                  ]
              }
          },
          "trim": true,
          "format": "mp4",
          "resolution": "1280x720",
          "status_callback": "http://www.example.com",
          "status_callback_method": "POST",
          "url": "https://video.twilio.com/v1/CompositionHooks/HKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.video.v1.composition_hooks.create(friendly_name: 'friendly_name')

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.video.v1.composition_hooks('HKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update(friendly_name: 'friendly_name')
    }.to raise_exception(Textgrid::REST::TwilioError)

    values = {'FriendlyName' => 'friendly_name', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://video.twilio.com/v1/CompositionHooks/HKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
        data: values,
    ))).to eq(true)
  end

  it "receives update_all_fields responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "friendly_name": "My composition hook",
          "enabled": true,
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "sid": "HKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "audio_sources": [
              "user*",
              "moderator"
          ],
          "audio_sources_excluded": [
              "admin"
          ],
          "video_layout": {
              "custom": {
                  "video_sources": [
                      "user*"
                  ],
                  "video_sources_excluded": [
                      "moderator"
                  ],
                  "reuse": "show_oldest",
                  "x_pos": 100,
                  "y_pos": 600,
                  "z_pos": 10,
                  "width": 800,
                  "height": 0,
                  "max_columns": 0,
                  "max_rows": 0,
                  "cells_excluded": [
                      2,
                      3
                  ]
              }
          },
          "trim": true,
          "format": "mp4",
          "resolution": "1280x720",
          "status_callback": "http://www.example.com",
          "status_callback_method": "POST",
          "url": "https://video.twilio.com/v1/CompositionHooks/HKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.video.v1.composition_hooks('HKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update(friendly_name: 'friendly_name')

    expect(actual).to_not eq(nil)
  end

  it "receives update_with_defaults responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "friendly_name": "My composition hook",
          "enabled": true,
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "sid": "HKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "audio_sources": [
              "user*",
              "moderator"
          ],
          "audio_sources_excluded": [
              "admin"
          ],
          "video_layout": {},
          "trim": true,
          "format": "mp4",
          "resolution": "1280x720",
          "status_callback": null,
          "status_callback_method": "POST",
          "url": "https://video.twilio.com/v1/CompositionHooks/HKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.video.v1.composition_hooks('HKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update(friendly_name: 'friendly_name')

    expect(actual).to_not eq(nil)
  end
end
