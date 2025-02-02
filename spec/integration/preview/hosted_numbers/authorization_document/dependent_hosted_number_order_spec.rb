##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'DependentHostedNumberOrder' do
  it "can read" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.preview.hosted_numbers.authorization_documents('PXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                    .dependent_hosted_number_orders.list()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://preview.twilio.com/HostedNumbers/AuthorizationDocuments/PXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/DependentHostedNumberOrders',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "meta": {
              "first_page_url": "https://preview.twilio.com/HostedNumbers/AuthorizationDocuments/PXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/DependentHostedNumberOrders?Status=completed&FriendlyName=example&PhoneNumber=%2B19193608000&UniqueName=something123&IncomingPhoneNumberSid=PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&PageSize=50&Page=0",
              "key": "items",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://preview.twilio.com/HostedNumbers/AuthorizationDocuments/PXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/DependentHostedNumberOrders?Status=completed&FriendlyName=example&PhoneNumber=%2B19193608000&UniqueName=something123&IncomingPhoneNumberSid=PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&PageSize=50&Page=0"
          },
          "items": []
      }
      ]
    ))

    actual = @client.preview.hosted_numbers.authorization_documents('PXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                           .dependent_hosted_number_orders.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_full responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "meta": {
              "first_page_url": "https://preview.twilio.com/HostedNumbers/AuthorizationDocuments/PXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/DependentHostedNumberOrders?PageSize=50&Page=0",
              "key": "items",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://preview.twilio.com/HostedNumbers/AuthorizationDocuments/PXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/DependentHostedNumberOrders?PageSize=50&Page=0"
          },
          "items": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "address_sid": "AD11111111111111111111111111111111",
                  "call_delay": 15,
                  "capabilities": {
                      "sms": true,
                      "voice": false
                  },
                  "cc_emails": [
                      "aaa@twilio.com",
                      "bbb@twilio.com"
                  ],
                  "date_created": "2017-03-28T20:06:39Z",
                  "date_updated": "2017-03-28T20:06:39Z",
                  "email": "test@twilio.com",
                  "extension": "1234",
                  "friendly_name": "friendly_name",
                  "incoming_phone_number_sid": "PN11111111111111111111111111111111",
                  "phone_number": "+14153608311",
                  "sid": "HRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "signing_document_sid": "PX11111111111111111111111111111111",
                  "status": "received",
                  "failure_reason": "",
                  "unique_name": "foobar",
                  "verification_attempts": 0,
                  "verification_call_sids": [
                      "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                      "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab"
                  ],
                  "verification_code": "8794",
                  "verification_document_sid": null,
                  "verification_type": "phone-call"
              }
          ]
      }
      ]
    ))

    actual = @client.preview.hosted_numbers.authorization_documents('PXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                           .dependent_hosted_number_orders.list()

    expect(actual).to_not eq(nil)
  end
end
