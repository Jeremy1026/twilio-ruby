##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'SupportingDocumentType' do
  it "can read" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.trusthub.v1.supporting_document_types.list()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://trusthub.twilio.com/v1/SupportingDocumentTypes',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "supporting_document_types": [],
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://trusthub.twilio.com/v1/SupportingDocumentTypes?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://trusthub.twilio.com/v1/SupportingDocumentTypes?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "supporting_document_types"
          }
      }
      ]
    ))

    actual = @client.trusthub.v1.supporting_document_types.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_full responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "supporting_document_types": [
              {
                  "url": "https://trusthub.twilio.com/v1/SupportingDocumentTypes/OYaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "fields": [
                      {
                          "machine_name": "address_sids",
                          "friendly_name": "Address Sids",
                          "constraint": "List"
                      }
                  ],
                  "machine_name": "customer_profile_address",
                  "friendly_name": "Customer profile address",
                  "sid": "OYaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              },
              {
                  "url": "https://trusthub.twilio.com/v1/SupportingDocumentTypes/OYaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "fields": [
                      {
                          "machine_name": "first_name",
                          "friendly_name": "First Name",
                          "constraint": "String"
                      },
                      {
                          "machine_name": "last_name",
                          "friendly_name": "Last Name",
                          "constraint": "String"
                      },
                      {
                          "machine_name": "business_name",
                          "friendly_name": "Business Name",
                          "constraint": "String"
                      }
                  ],
                  "machine_name": "government_issued_proof_of_authorized_representative",
                  "friendly_name": "Government Issued Identity certifying proof of being an authorized representative of a company",
                  "sid": "OYaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              }
          ],
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://trusthub.twilio.com/v1/SupportingDocumentTypes?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://trusthub.twilio.com/v1/SupportingDocumentTypes?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "supporting_document_types"
          }
      }
      ]
    ))

    actual = @client.trusthub.v1.supporting_document_types.list()

    expect(actual).to_not eq(nil)
  end

  it "can fetch" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.trusthub.v1.supporting_document_types('OYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://trusthub.twilio.com/v1/SupportingDocumentTypes/OYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "url": "https://trusthub.twilio.com/v1/SupportingDocumentTypes/OYaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "fields": [
              {
                  "machine_name": "first_name",
                  "friendly_name": "First Name",
                  "constraint": "String"
              },
              {
                  "machine_name": "last_name",
                  "friendly_name": "Last Name",
                  "constraint": "String"
              },
              {
                  "machine_name": "business_name",
                  "friendly_name": "Business Name",
                  "constraint": "String"
              }
          ],
          "machine_name": "government_issued_proof_of_authorized_representative",
          "friendly_name": "Government Issued Identity certifying proof of being an authorized representative of a company",
          "sid": "OYaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.trusthub.v1.supporting_document_types('OYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end
end
