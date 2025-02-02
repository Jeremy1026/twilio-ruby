##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'TrustProductsEntityAssignments' do
  it "can create" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.trusthub.v1.trust_products('BUXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                         .trust_products_entity_assignments.create(object_sid: 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
    }.to raise_exception(Textgrid::REST::TwilioError)

    values = {'ObjectSid' => 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://trusthub.twilio.com/v1/TrustProducts/BUXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/EntityAssignments',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Textgrid::Response.new(
        201,
      %q[
      {
          "sid": "BVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "trust_product_sid": "BUaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "object_sid": "RDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2019-07-31T02:34:41Z",
          "url": "https://trusthub.twilio.com/v1/TrustProducts/BUaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/EntityAssignments/BVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.trusthub.v1.trust_products('BUXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                .trust_products_entity_assignments.create(object_sid: 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.trusthub.v1.trust_products('BUXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                         .trust_products_entity_assignments.list()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://trusthub.twilio.com/v1/TrustProducts/BUXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/EntityAssignments',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "results": [],
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://trusthub.twilio.com/v1/TrustProducts/BUaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/EntityAssignments?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://trusthub.twilio.com/v1/TrustProducts/BUaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/EntityAssignments?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "results"
          }
      }
      ]
    ))

    actual = @client.trusthub.v1.trust_products('BUXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                .trust_products_entity_assignments.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_full responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "results": [
              {
                  "sid": "BVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "trust_product_sid": "BUaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "object_sid": "RDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_created": "2019-07-31T02:34:41Z",
                  "url": "https://trusthub.twilio.com/v1/TrustProducts/BUaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/EntityAssignments/BVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              }
          ],
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://trusthub.twilio.com/v1/TrustProducts/BUaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/EntityAssignments?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://trusthub.twilio.com/v1/TrustProducts/BUaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/EntityAssignments?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "results"
          }
      }
      ]
    ))

    actual = @client.trusthub.v1.trust_products('BUXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                .trust_products_entity_assignments.list()

    expect(actual).to_not eq(nil)
  end

  it "can fetch" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.trusthub.v1.trust_products('BUXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                         .trust_products_entity_assignments('BVXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://trusthub.twilio.com/v1/TrustProducts/BUXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/EntityAssignments/BVXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "sid": "BVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "trust_product_sid": "BUaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "object_sid": "RDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2019-07-31T02:34:41Z",
          "url": "https://trusthub.twilio.com/v1/TrustProducts/BUaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/EntityAssignments/BVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.trusthub.v1.trust_products('BUXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                .trust_products_entity_assignments('BVXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.trusthub.v1.trust_products('BUXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                         .trust_products_entity_assignments('BVXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://trusthub.twilio.com/v1/TrustProducts/BUXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/EntityAssignments/BVXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Textgrid::Response.new(
        204,
      nil,
    ))

    actual = @client.trusthub.v1.trust_products('BUXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                .trust_products_entity_assignments('BVXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end
end
