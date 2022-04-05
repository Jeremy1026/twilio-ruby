##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'UsageRecord' do
  it "can read" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.supersim.v1.usage_records.list()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://supersim.twilio.com/v1/UsageRecords',
    ))).to eq(true)
  end

  it "receives read_all responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "usage_records": [
              {
                  "period": {
                      "start_time": "2015-05-01T20:00:00Z",
                      "end_time": "2015-06-01T20:00:00Z"
                  },
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "data_upload": 1000,
                  "data_download": 1000,
                  "data_total": 2000,
                  "sim_sid": null,
                  "fleet_sid": null,
                  "network_sid": null,
                  "iso_country": null
              }
          ],
          "meta": {
              "first_page_url": "https://supersim.twilio.com/v1/UsageRecords?PageSize=50&Page=0",
              "key": "usage_records",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://supersim.twilio.com/v1/UsageRecords?PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.supersim.v1.usage_records.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_all_day responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "usage_records": [
              {
                  "period": {
                      "start_time": "2019-05-03T00:00:00Z",
                      "end_time": "2019-05-04T00:00:00Z"
                  },
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "data_upload": 1000,
                  "data_download": 1000,
                  "data_total": 2000,
                  "sim_sid": null,
                  "fleet_sid": null,
                  "network_sid": null,
                  "iso_country": null
              },
              {
                  "period": {
                      "start_time": "2019-05-02T00:00:00Z",
                      "end_time": "2019-05-03T00:00:00Z"
                  },
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "data_upload": 1000,
                  "data_download": 1000,
                  "data_total": 2000,
                  "sim_sid": null,
                  "fleet_sid": null,
                  "network_sid": null,
                  "iso_country": null
              }
          ],
          "meta": {
              "first_page_url": "https://supersim.twilio.com/v1/UsageRecords?Granularity=day&PageSize=50&Page=0",
              "key": "usage_records",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://supersim.twilio.com/v1/UsageRecords?Granularity=day&PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.supersim.v1.usage_records.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_all_hour responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "usage_records": [
              {
                  "period": {
                      "start_time": "2019-05-01T01:00:00Z",
                      "end_time": "2019-05-01T02:00:00Z"
                  },
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "data_upload": 1000,
                  "data_download": 1000,
                  "data_total": 2000,
                  "sim_sid": null,
                  "fleet_sid": null,
                  "network_sid": null,
                  "iso_country": null
              },
              {
                  "period": {
                      "start_time": "2019-05-01T00:00:00Z",
                      "end_time": "2019-05-01T01:00:00Z"
                  },
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "data_upload": 1000,
                  "data_download": 1000,
                  "data_total": 2000,
                  "sim_sid": null,
                  "fleet_sid": null,
                  "network_sid": null,
                  "iso_country": null
              }
          ],
          "meta": {
              "first_page_url": "https://supersim.twilio.com/v1/UsageRecords?Granularity=hour&PageSize=50&Page=0",
              "key": "usage_records",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://supersim.twilio.com/v1/UsageRecords?Granularity=hour&PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.supersim.v1.usage_records.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_day_sim_filter responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "usage_records": [
              {
                  "period": {
                      "start_time": "2019-05-03T00:00:00Z",
                      "end_time": "2019-05-04T00:00:00Z"
                  },
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "data_upload": 1000,
                  "data_download": 1000,
                  "data_total": 2000,
                  "sim_sid": "HSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "fleet_sid": null,
                  "network_sid": null,
                  "iso_country": null
              },
              {
                  "period": {
                      "start_time": "2019-05-02T00:00:00Z",
                      "end_time": "2019-05-03T00:00:00Z"
                  },
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "data_upload": 1000,
                  "data_download": 1000,
                  "data_total": 2000,
                  "sim_sid": "HSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "fleet_sid": null,
                  "network_sid": null,
                  "iso_country": null
              }
          ],
          "meta": {
              "first_page_url": "https://supersim.twilio.com/v1/UsageRecords?Sim=HSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&Granularity=day&PageSize=50&Page=0",
              "key": "usage_records",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://supersim.twilio.com/v1/UsageRecords?Sim=HSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&Granularity=day&PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.supersim.v1.usage_records.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_day_network_filter responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "usage_records": [
              {
                  "period": {
                      "start_time": "2019-05-03T00:00:00Z",
                      "end_time": "2019-05-04T00:00:00Z"
                  },
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "data_upload": 1000,
                  "data_download": 1000,
                  "data_total": 2000,
                  "sim_sid": null,
                  "fleet_sid": null,
                  "network_sid": "HWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "iso_country": null
              },
              {
                  "period": {
                      "start_time": "2019-05-02T00:00:00Z",
                      "end_time": "2019-05-03T00:00:00Z"
                  },
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "data_upload": 1000,
                  "data_download": 1000,
                  "data_total": 2000,
                  "sim_sid": null,
                  "fleet_sid": null,
                  "network_sid": "HWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "iso_country": null
              }
          ],
          "meta": {
              "first_page_url": "https://supersim.twilio.com/v1/UsageRecords?Network=HWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&Granularity=day&PageSize=50&Page=0",
              "key": "usage_records",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://supersim.twilio.com/v1/UsageRecords?Network=HWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&Granularity=day&PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.supersim.v1.usage_records.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_day_country_filter responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "usage_records": [
              {
                  "period": {
                      "start_time": "2019-05-03T00:00:00Z",
                      "end_time": "2019-05-04T00:00:00Z"
                  },
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "data_upload": 1000,
                  "data_download": 1000,
                  "data_total": 2000,
                  "sim_sid": null,
                  "fleet_sid": null,
                  "network_sid": null,
                  "iso_country": "FR"
              },
              {
                  "period": {
                      "start_time": "2019-05-02T00:00:00Z",
                      "end_time": "2019-05-03T00:00:00Z"
                  },
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "data_upload": 1000,
                  "data_download": 1000,
                  "data_total": 2000,
                  "sim_sid": null,
                  "fleet_sid": null,
                  "network_sid": null,
                  "iso_country": "FR"
              }
          ],
          "meta": {
              "first_page_url": "https://supersim.twilio.com/v1/UsageRecords?IsoCountry=FR&Granularity=day&PageSize=50&Page=0",
              "key": "usage_records",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://supersim.twilio.com/v1/UsageRecords?IsoCountry=FR&Granularity=day&PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.supersim.v1.usage_records.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_day_fleet_filter responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "usage_records": [
              {
                  "period": {
                      "start_time": "2019-05-03T00:00:00Z",
                      "end_time": "2019-05-04T00:00:00Z"
                  },
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "data_upload": 1000,
                  "data_download": 1000,
                  "data_total": 2000,
                  "sim_sid": null,
                  "fleet_sid": "HFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "network_sid": null,
                  "iso_country": null
              },
              {
                  "period": {
                      "start_time": "2019-05-02T00:00:00Z",
                      "end_time": "2019-05-03T00:00:00Z"
                  },
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "data_upload": 1000,
                  "data_download": 1000,
                  "data_total": 2000,
                  "sim_sid": null,
                  "fleet_sid": "HFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "network_sid": null,
                  "iso_country": null
              }
          ],
          "meta": {
              "first_page_url": "https://supersim.twilio.com/v1/UsageRecords?Fleet=HFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&Granularity=day&PageSize=50&Page=0",
              "key": "usage_records",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://supersim.twilio.com/v1/UsageRecords?Fleet=HFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&Granularity=day&PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.supersim.v1.usage_records.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_day_group_by_sim responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "usage_records": [
              {
                  "period": {
                      "start_time": "2019-05-03T00:00:00Z",
                      "end_time": "2019-05-04T00:00:00Z"
                  },
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "data_upload": 1000,
                  "data_download": 1000,
                  "data_total": 2000,
                  "sim_sid": "HSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "fleet_sid": null,
                  "network_sid": null,
                  "iso_country": null
              },
              {
                  "period": {
                      "start_time": "2019-05-03T00:00:00Z",
                      "end_time": "2019-05-04T00:00:00Z"
                  },
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "data_upload": 500,
                  "data_download": 1500,
                  "data_total": 2000,
                  "sim_sid": "HSbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb",
                  "fleet_sid": null,
                  "network_sid": null,
                  "iso_country": null
              }
          ],
          "meta": {
              "first_page_url": "https://supersim.twilio.com/v1/UsageRecords?Group=sim&PageSize=50&Page=0",
              "key": "usage_records",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://supersim.twilio.com/v1/UsageRecords?Group=sim&PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.supersim.v1.usage_records.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_day_group_by_fleet responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "usage_records": [
              {
                  "period": {
                      "start_time": "2019-05-03T00:00:00Z",
                      "end_time": "2019-05-04T00:00:00Z"
                  },
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "data_upload": 1000,
                  "data_download": 1000,
                  "data_total": 2000,
                  "sim_sid": null,
                  "fleet_sid": "HFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "network_sid": null,
                  "iso_country": null
              },
              {
                  "period": {
                      "start_time": "2019-05-03T00:00:00Z",
                      "end_time": "2019-05-04T00:00:00Z"
                  },
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "data_upload": 500,
                  "data_download": 1500,
                  "data_total": 2000,
                  "sim_sid": null,
                  "fleet_sid": "HFbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb",
                  "network_sid": null,
                  "iso_country": null
              }
          ],
          "meta": {
              "first_page_url": "https://supersim.twilio.com/v1/UsageRecords?Group=fleet&PageSize=50&Page=0",
              "key": "usage_records",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://supersim.twilio.com/v1/UsageRecords?Group=fleet&PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.supersim.v1.usage_records.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_day_group_by_network responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "usage_records": [
              {
                  "period": {
                      "start_time": "2019-05-03T00:00:00Z",
                      "end_time": "2019-05-04T00:00:00Z"
                  },
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "data_upload": 1000,
                  "data_download": 1000,
                  "data_total": 2000,
                  "sim_sid": null,
                  "fleet_sid": null,
                  "network_sid": "HWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "iso_country": null
              },
              {
                  "period": {
                      "start_time": "2019-05-03T00:00:00Z",
                      "end_time": "2019-05-04T00:00:00Z"
                  },
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "data_upload": 500,
                  "data_download": 1500,
                  "data_total": 2000,
                  "sim_sid": null,
                  "fleet_sid": null,
                  "network_sid": "HWbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb",
                  "iso_country": null
              }
          ],
          "meta": {
              "first_page_url": "https://supersim.twilio.com/v1/UsageRecords?Group=network&PageSize=50&Page=0",
              "key": "usage_records",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://supersim.twilio.com/v1/UsageRecords?Group=network&PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.supersim.v1.usage_records.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_day_group_by_iso_country responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "usage_records": [
              {
                  "period": {
                      "start_time": "2019-05-03T00:00:00Z",
                      "end_time": "2019-05-04T00:00:00Z"
                  },
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "data_upload": 1000,
                  "data_download": 1000,
                  "data_total": 2000,
                  "sim_sid": null,
                  "fleet_sid": null,
                  "network_sid": null,
                  "iso_country": "FR"
              },
              {
                  "period": {
                      "start_time": "2019-05-03T00:00:00Z",
                      "end_time": "2019-05-04T00:00:00Z"
                  },
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "data_upload": 500,
                  "data_download": 1500,
                  "data_total": 2000,
                  "sim_sid": null,
                  "fleet_sid": null,
                  "network_sid": null,
                  "iso_country": "US"
              }
          ],
          "meta": {
              "first_page_url": "https://supersim.twilio.com/v1/UsageRecords?Group=isoCountry&PageSize=50&Page=0",
              "key": "usage_records",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://supersim.twilio.com/v1/UsageRecords?Group=isoCountry&PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.supersim.v1.usage_records.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_day_group_by_sim_and_filter_by_country responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "usage_records": [
              {
                  "period": {
                      "start_time": "2019-05-03T00:00:00Z",
                      "end_time": "2019-05-04T00:00:00Z"
                  },
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "data_upload": 1000,
                  "data_download": 1000,
                  "data_total": 2000,
                  "sim_sid": "HSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "fleet_sid": null,
                  "network_sid": null,
                  "iso_country": "FR"
              },
              {
                  "period": {
                      "start_time": "2019-05-03T00:00:00Z",
                      "end_time": "2019-05-04T00:00:00Z"
                  },
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "data_upload": 500,
                  "data_download": 1500,
                  "data_total": 2000,
                  "sim_sid": "HSbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb",
                  "fleet_sid": null,
                  "network_sid": null,
                  "iso_country": "FR"
              }
          ],
          "meta": {
              "first_page_url": "https://supersim.twilio.com/v1/UsageRecords?IsoCountry=FR&Group=sim&PageSize=50&Page=0",
              "key": "usage_records",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://supersim.twilio.com/v1/UsageRecords?IsoCountry=FR&Group=sim&PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.supersim.v1.usage_records.list()

    expect(actual).to_not eq(nil)
  end
end
