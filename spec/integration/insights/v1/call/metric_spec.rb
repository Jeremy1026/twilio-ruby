##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Metric' do
  it "can read" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.insights.v1.calls('CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                         .metrics.list()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://insights.twilio.com/v1/Voice/CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Metrics',
    ))).to eq(true)
  end

  it "receives read responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://insights.twilio.com/v1/Voice/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Metrics?PageSize=50&Page=0",
              "previous_page_url": null,
              "next_page_url": null,
              "key": "metrics",
              "url": "https://insights.twilio.com/v1/Voice/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Metrics?PageSize=50&Page=0"
          },
          "metrics": [
              {
                  "timestamp": "2019-10-07T22:32:06Z",
                  "call_sid": "CA7569efe0253644fa4a88aa97beca3310",
                  "account_sid": "AC998c10b68cbfda9f67277f7d8f4439c9",
                  "edge": "sdk_edge",
                  "direction": "both",
                  "sdk_edge": {
                      "interval": {
                          "packets_received": 50,
                          "packets_lost": 0,
                          "audio_in": {
                              "value": 81.0
                          },
                          "audio_out": {
                              "value": 5237.0
                          },
                          "jitter": {
                              "value": 9
                          },
                          "mos": {
                              "value": 4.39
                          },
                          "rtt": {
                              "value": 81
                          }
                      },
                      "cumulative": {
                          "bytes_received": 547788,
                          "bytes_sent": 329425,
                          "packets_received": 3900,
                          "packets_lost": 0,
                          "packets_sent": 3934
                      }
                  },
                  "client_edge": null,
                  "carrier_edge": null,
                  "sip_edge": null
              }
          ]
      }
      ]
    ))

    actual = @client.insights.v1.calls('CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                .metrics.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_full responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "meta": {
              "page": 10,
              "page_size": 5,
              "first_page_url": "https://insights.twilio.com/v1/Voice/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Metrics?Direction=both&Edge=sdk_edge&PageSize=5&Page=0",
              "previous_page_url": "https://insights.twilio.com/v1/Voice/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Metrics?Direction=both&Edge=sdk_edge&PageSize=5&Page=9&PageToken=DP10",
              "next_page_url": null,
              "key": "metrics",
              "url": "https://insights.twilio.com/v1/Voice/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Metrics?Direction=both&Edge=sdk_edge&PageSize=5&Page=10"
          },
          "metrics": [
              {
                  "timestamp": "2019-10-07T22:32:06Z",
                  "call_sid": "CA7569efe0253644fa4a88aa97beca3310",
                  "account_sid": "AC998c10b68cbfda9f67277f7d8f4439c9",
                  "edge": "sdk_edge",
                  "direction": "both",
                  "sdk_edge": {
                      "interval": {
                          "packets_received": 50,
                          "packets_lost": 0,
                          "audio_in": {
                              "value": 81.0
                          },
                          "audio_out": {
                              "value": 5237.0
                          },
                          "jitter": {
                              "value": 9
                          },
                          "mos": {
                              "value": 4.39
                          },
                          "rtt": {
                              "value": 81
                          }
                      },
                      "cumulative": {
                          "bytes_received": 547788,
                          "bytes_sent": 329425,
                          "packets_received": 3900,
                          "packets_lost": 0,
                          "packets_sent": 3934
                      }
                  },
                  "client_edge": null,
                  "carrier_edge": null,
                  "sip_edge": null
              }
          ]
      }
      ]
    ))

    actual = @client.insights.v1.calls('CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                .metrics.list()

    expect(actual).to_not eq(nil)
  end
end
