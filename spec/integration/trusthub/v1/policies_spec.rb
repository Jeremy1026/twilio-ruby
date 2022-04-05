##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Policies' do
  it "can read" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.trusthub.v1.policies.list()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://trusthub.twilio.com/v1/Policies',
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
              "first_page_url": "https://trusthub.twilio.com/v1/Policies?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://trusthub.twilio.com/v1/Policies?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "results"
          }
      }
      ]
    ))

    actual = @client.trusthub.v1.policies.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_full responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://trusthub.twilio.com/v1/Policies?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://trusthub.twilio.com/v1/Policies?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "results"
          },
          "results": [
              {
                  "url": "https://trusthub.twilio.com/v1/Policies/RNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "requirements": {
                      "end_user": [
                          {
                              "url": "/EndUserTypes/customer_profile_business_information",
                              "fields": [
                                  "business_type",
                                  "business_registration_number",
                                  "business_name",
                                  "business_registration_identifier",
                                  "business_identity",
                                  "business_industry",
                                  "website_url",
                                  "business_regions_of_operation",
                                  "social_media_profile_urls"
                              ],
                              "type": "customer_profile_business_information",
                              "name": "Business Information",
                              "requirement_name": "customer_profile_business_information"
                          },
                          {
                              "url": "/EndUserTypes/authorized_representative_1",
                              "fields": [
                                  "first_name",
                                  "last_name",
                                  "email",
                                  "phone_number",
                                  "business_title",
                                  "job_position"
                              ],
                              "type": "authorized_representative_1",
                              "name": "Authorized Representative 1",
                              "requirement_name": "authorized_representative_1"
                          },
                          {
                              "url": "/EndUserTypes/authorized_representative_2",
                              "fields": [
                                  "first_name",
                                  "last_name",
                                  "email",
                                  "phone_number",
                                  "business_title",
                                  "job_position"
                              ],
                              "type": "authorized_representative_2",
                              "name": "Authorized Representative 2",
                              "requirement_name": "authorized_representative_2"
                          }
                      ],
                      "supporting_trust_products": [],
                      "supporting_document": [
                          [
                              {
                                  "description": "Customer Profile HQ Physical Address",
                                  "type": "document",
                                  "name": "Physical Business Address",
                                  "accepted_documents": [
                                      {
                                          "url": "/SupportingDocumentTypes/customer_profile_address",
                                          "fields": [
                                              "address_sids"
                                          ],
                                          "type": "customer_profile_address",
                                          "name": "Physical Business Address"
                                      }
                                  ],
                                  "requirement_name": "customer_profile_address"
                              }
                          ]
                      ],
                      "supporting_customer_profiles": []
                  },
                  "friendly_name": "Primary Customer Profile of type Business",
                  "sid": "RNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              }
          ]
      }
      ]
    ))

    actual = @client.trusthub.v1.policies.list()

    expect(actual).to_not eq(nil)
  end

  it "can fetch" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.trusthub.v1.policies('RNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://trusthub.twilio.com/v1/Policies/RNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "url": "https://trusthub.twilio.com/v1/Policies/RNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "requirements": {
              "end_user": [
                  {
                      "url": "/EndUserTypes/customer_profile_business_information",
                      "fields": [
                          "business_type",
                          "business_registration_number",
                          "business_name",
                          "business_registration_identifier",
                          "business_identity",
                          "business_industry",
                          "website_url",
                          "business_regions_of_operation",
                          "social_media_profile_urls"
                      ],
                      "type": "customer_profile_business_information",
                      "name": "Business Information",
                      "requirement_name": "customer_profile_business_information"
                  },
                  {
                      "url": "/EndUserTypes/authorized_representative_1",
                      "fields": [
                          "first_name",
                          "last_name",
                          "email",
                          "phone_number",
                          "business_title",
                          "job_position"
                      ],
                      "type": "authorized_representative_1",
                      "name": "Authorized Representative 1",
                      "requirement_name": "authorized_representative_1"
                  },
                  {
                      "url": "/EndUserTypes/authorized_representative_2",
                      "fields": [
                          "first_name",
                          "last_name",
                          "email",
                          "phone_number",
                          "business_title",
                          "job_position"
                      ],
                      "type": "authorized_representative_2",
                      "name": "Authorized Representative 2",
                      "requirement_name": "authorized_representative_2"
                  }
              ],
              "supporting_trust_products": [],
              "supporting_document": [
                  [
                      {
                          "description": "Customer Profile HQ Physical Address",
                          "type": "document",
                          "name": "Physical Business Address",
                          "accepted_documents": [
                              {
                                  "url": "/SupportingDocumentTypes/customer_profile_address",
                                  "fields": [
                                      "address_sids"
                                  ],
                                  "type": "customer_profile_address",
                                  "name": "Physical Business Address"
                              }
                          ],
                          "requirement_name": "customer_profile_address"
                      }
                  ]
              ],
              "supporting_customer_profiles": []
          },
          "friendly_name": "Primary Customer Profile of type Business",
          "sid": "RNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.trusthub.v1.policies('RNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end
end
