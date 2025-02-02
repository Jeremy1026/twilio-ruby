##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'PhoneNumber' do
  it "can fetch" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.lookups.v1.phone_numbers('+15017122661').fetch()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://lookups.twilio.com/v1/PhoneNumbers/%2B15017122661',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "caller_name": null,
          "carrier": null,
          "fraud": null,
          "add_ons": null,
          "country_code": "US",
          "national_format": "(510) 867-5310",
          "phone_number": "+15108675310",
          "url": "https://lookups.twilio.com/v1/PhoneNumbers/+15108675310"
      }
      ]
    ))

    actual = @client.lookups.v1.phone_numbers('+15017122661').fetch()

    expect(actual).to_not eq(nil)
  end

  it "receives fetch_carrier responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "caller_name": null,
          "carrier": {
              "error_code": null,
              "mobile_country_code": "310",
              "mobile_network_code": "456",
              "name": "verizon",
              "type": "mobile"
          },
          "country_code": "US",
          "national_format": "(510) 867-5310",
          "phone_number": "+15108675310",
          "fraud": null,
          "add_ons": null,
          "url": "https://lookups.twilio.com/v1/PhoneNumbers/+15108675310"
      }
      ]
    ))

    actual = @client.lookups.v1.phone_numbers('+15017122661').fetch()

    expect(actual).to_not eq(nil)
  end

  it "receives fetch_carrier_international responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "caller_name": null,
          "carrier": {
              "error_code": null,
              "mobile_country_code": null,
              "mobile_network_code": null,
              "name": "Vodafone Business Solutions",
              "type": "landline"
          },
          "country_code": "GB",
          "national_format": "020 7765 1182",
          "phone_number": "+4402077651182",
          "fraud": null,
          "add_ons": null,
          "url": "https://lookups.twilio.com/v1/PhoneNumbers/+4402077651182"
      }
      ]
    ))

    actual = @client.lookups.v1.phone_numbers('+15017122661').fetch()

    expect(actual).to_not eq(nil)
  end

  it "receives fetch_caller_name responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "caller_name": {
              "caller_name": "Delicious Cheese Cake",
              "caller_type": "CONSUMER",
              "error_code": null
          },
          "carrier": null,
          "fraud": null,
          "country_code": "US",
          "national_format": "(510) 867-5310",
          "phone_number": "+15108675310",
          "add_ons": null,
          "url": "https://lookups.twilio.com/v1/PhoneNumbers/+15108675310"
      }
      ]
    ))

    actual = @client.lookups.v1.phone_numbers('+15017122661').fetch()

    expect(actual).to_not eq(nil)
  end

  it "receives fetch_carrier_and_caller_name responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "caller_name": {
              "caller_name": "Delicious Cheese Cake",
              "caller_type": "CONSUMER",
              "error_code": null
          },
          "carrier": {
              "error_code": null,
              "mobile_country_code": "310",
              "mobile_network_code": "456",
              "name": "verizon",
              "type": "mobile"
          },
          "fraud": null,
          "country_code": "US",
          "national_format": "(510) 867-5310",
          "phone_number": "+15108675310",
          "add_ons": {
              "status": "successful",
              "message": null,
              "code": null,
              "results": {}
          },
          "url": "https://lookups.twilio.com/v1/PhoneNumbers/+15108675310"
      }
      ]
    ))

    actual = @client.lookups.v1.phone_numbers('+15017122661').fetch()

    expect(actual).to_not eq(nil)
  end

  it "receives fetch_addons_whitepages_pro responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "caller_name": {
              "caller_name": "EMPIRE STATE BUILDING",
              "caller_type": "BUSINESS",
              "error_code": null
          },
          "country_code": "US",
          "phone_number": "+12127363100",
          "national_format": "(212) 736-3100",
          "carrier": null,
          "fraud": null,
          "add_ons": {
              "status": "successful",
              "message": null,
              "code": null,
              "results": {
                  "whitepages_pro_caller_id": {
                      "status": "successful",
                      "request_sid": "XR28b8f152ae12345605b0b3cc34123456",
                      "message": null,
                      "code": null,
                      "result": {
                          "phone_number": "2127363100",
                          "warnings": [],
                          "historical_addresses": [],
                          "alternate_phones": [],
                          "error": null,
                          "is_commercial": true,
                          "associated_people": [],
                          "country_calling_code": "1",
                          "belongs_to": [],
                          "is_valid": true,
                          "line_type": "NonFixedVOIP",
                          "carrier": "Level 3 Communications",
                          "current_addresses": [
                              {
                                  "city": "New York",
                                  "lat_long": {
                                      "latitude": 40.748731,
                                      "longitude": -73.986413,
                                      "accuracy": "RoofTop"
                                  },
                                  "is_active": null,
                                  "location_type": "Address",
                                  "street_line_2": null,
                                  "link_to_person_start_date": "2018-08-28",
                                  "street_line_1": "350 5th Ave",
                                  "postal_code": "10118",
                                  "delivery_point": "MultiUnit",
                                  "country_code": "US",
                                  "state_code": "NY",
                                  "id": "Location.4e81b857-1234-5678-31d29a3301e1",
                                  "zip4": "0110"
                              }
                          ],
                          "id": "Phone.f8396fef-1234-5678-bc7128b6fd99",
                          "is_prepaid": false
                      }
                  }
              }
          },
          "url": "https://lookups.twilio.com/v1/PhoneNumbers/+12127363100"
      }
      ]
    ))

    actual = @client.lookups.v1.phone_numbers('+15017122661').fetch()

    expect(actual).to_not eq(nil)
  end

  it "receives fetch_addons_nomorobo responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "caller_name": null,
          "country_code": "US",
          "phone_number": "+19892008374",
          "national_format": "(989) 200-8374",
          "carrier": {
              "mobile_country_code": "310",
              "mobile_network_code": null,
              "name": "Ytel/Blitz",
              "type": "mobile",
              "error_code": null
          },
          "fraud": null,
          "add_ons": {
              "status": "successful",
              "message": null,
              "code": null,
              "results": {
                  "nomorobo_spamscore": {
                      "status": "successful",
                      "request_sid": "XR763c8acc4c56d5e3e18d2f0f12345bc1",
                      "message": null,
                      "code": null,
                      "result": {
                          "status": "success",
                          "message": "success",
                          "score": 1
                      }
                  }
              }
          },
          "url": "https://lookups.twilio.com/v1/PhoneNumbers/+19892008374"
      }
      ]
    ))

    actual = @client.lookups.v1.phone_numbers('+15017122661').fetch()

    expect(actual).to_not eq(nil)
  end

  it "receives fetch_addons_payfone responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "caller_name": null,
          "country_code": "US",
          "phone_number": "+16502530000",
          "national_format": "(650) 253-0000",
          "carrier": {
              "mobile_country_code": null,
              "mobile_network_code": null,
              "name": "Level 3 Communications, LLC",
              "type": "landline",
              "error_code": null
          },
          "fraud": null,
          "add_ons": {
              "status": "successful",
              "message": null,
              "code": null,
              "results": {
                  "payfone_tcpa_compliance": {
                      "status": "successful",
                      "request_sid": "XRd3a2991c9108bde3ca9589ed84d31463",
                      "message": null,
                      "code": null,
                      "result": {
                          "Status": 0,
                          "Response": {
                              "MSISDNType": "NonFixedVoIP",
                              "NumberMatch": "I",
                              "VerifyNumberTransactionId": "2019459819"
                          },
                          "RequestId": "XRd3a2991c9108bde3ca9589ed84d31463",
                          "Description": "Success."
                      }
                  }
              }
          },
          "url": "https://lookups.twilio.com/v1/PhoneNumbers/+16502530000"
      }
      ]
    ))

    actual = @client.lookups.v1.phone_numbers('+15017122661').fetch()

    expect(actual).to_not eq(nil)
  end
end
