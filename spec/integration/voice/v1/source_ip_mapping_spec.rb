##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'SourceIpMapping' do
  it "can create" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.voice.v1.source_ip_mappings.create(ip_record_sid: 'ILXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', sip_domain_sid: 'SDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
    }.to raise_exception(Textgrid::REST::TwilioError)

    values = {
        'IpRecordSid' => 'ILXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
        'SipDomainSid' => 'SDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://voice.twilio.com/v1/SourceIpMappings',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Textgrid::Response.new(
        201,
      %q[
      {
          "sid": "IBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "ip_record_sid": "ILaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sip_domain_sid": "SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2020-03-18T23:31:36Z",
          "date_updated": "2020-03-18T23:31:36Z",
          "url": "https://voice.twilio.com/v1/SourceIpMappings/IBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.voice.v1.source_ip_mappings.create(ip_record_sid: 'ILXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', sip_domain_sid: 'SDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

    expect(actual).to_not eq(nil)
  end

  it "can fetch" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.voice.v1.source_ip_mappings('IBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://voice.twilio.com/v1/SourceIpMappings/IBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "sid": "IBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "ip_record_sid": "ILaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sip_domain_sid": "SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2020-03-18T23:31:36Z",
          "date_updated": "2020-03-18T23:31:37Z",
          "url": "https://voice.twilio.com/v1/SourceIpMappings/IBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.voice.v1.source_ip_mappings('IBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.voice.v1.source_ip_mappings.list()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://voice.twilio.com/v1/SourceIpMappings',
    ))).to eq(true)
  end

  it "receives read_full responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://voice.twilio.com/v1/SourceIpMappings?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://voice.twilio.com/v1/SourceIpMappings?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "source_ip_mappings"
          },
          "source_ip_mappings": [
              {
                  "sid": "IBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "ip_record_sid": "ILaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "sip_domain_sid": "SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_created": "2020-03-18T23:31:36Z",
                  "date_updated": "2020-03-18T23:31:37Z",
                  "url": "https://voice.twilio.com/v1/SourceIpMappings/IBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              }
          ]
      }
      ]
    ))

    actual = @client.voice.v1.source_ip_mappings.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://voice.twilio.com/v1/SourceIpMappings?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://voice.twilio.com/v1/SourceIpMappings?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "source_ip_mappings"
          },
          "source_ip_mappings": []
      }
      ]
    ))

    actual = @client.voice.v1.source_ip_mappings.list()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.voice.v1.source_ip_mappings('IBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update(sip_domain_sid: 'SDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
    }.to raise_exception(Textgrid::REST::TwilioError)

    values = {'SipDomainSid' => 'SDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://voice.twilio.com/v1/SourceIpMappings/IBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
        data: values,
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "sid": "IBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "ip_record_sid": "ILaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sip_domain_sid": "SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab",
          "date_created": "2020-03-18T23:31:36Z",
          "date_updated": "2020-03-18T23:31:37Z",
          "url": "https://voice.twilio.com/v1/SourceIpMappings/IBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.voice.v1.source_ip_mappings('IBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update(sip_domain_sid: 'SDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.voice.v1.source_ip_mappings('IBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://voice.twilio.com/v1/SourceIpMappings/IBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Textgrid::Response.new(
        204,
      nil,
    ))

    actual = @client.voice.v1.source_ip_mappings('IBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end
end
