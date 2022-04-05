##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'ExportConfiguration' do
  it "can fetch" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.preview.bulk_exports.export_configuration('resource_type').fetch()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://preview.twilio.com/BulkExports/Exports/resource_type/Configuration',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "url": "https://preview.twilio.com/BulkExports/Exports/Calls/Configuration",
          "enabled": true,
          "webhook_url": "",
          "webhook_method": "",
          "resource_type": "Calls"
      }
      ]
    ))

    actual = @client.preview.bulk_exports.export_configuration('resource_type').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.preview.bulk_exports.export_configuration('resource_type').update()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://preview.twilio.com/BulkExports/Exports/resource_type/Configuration',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "url": "https://preview.twilio.com/BulkExports/Exports/Calls/Configuration",
          "enabled": true,
          "webhook_url": "",
          "resource_type": "Calls",
          "webhook_method": ""
      }
      ]
    ))

    actual = @client.preview.bulk_exports.export_configuration('resource_type').update()

    expect(actual).to_not eq(nil)
  end
end
