##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'User' do
  it "can fetch" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.frontline_api.v1.users('sid').fetch()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://frontline-api2.textgrid.com/v1/Users/sid',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "sid": "USaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "identity": "john@example.com",
          "friendly_name": "John Doe",
          "avatar": "https://example.com/profile.png",
          "state": "active",
          "is_available": true,
          "url": "https://frontline-api2.textgrid.com/v1/Users/USaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.frontline_api.v1.users('sid').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.frontline_api.v1.users('sid').update()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://frontline-api2.textgrid.com/v1/Users/sid',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "sid": "USaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "identity": "john@example.com",
          "friendly_name": "John Doe",
          "avatar": "https://example.com/profile.png",
          "state": "active",
          "is_available": true,
          "url": "https://frontline-api2.textgrid.com/v1/Users/USaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.frontline_api.v1.users('sid').update()

    expect(actual).to_not eq(nil)
  end
end
