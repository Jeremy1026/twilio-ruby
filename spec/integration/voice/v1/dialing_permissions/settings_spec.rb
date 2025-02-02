##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Settings' do
  it "can fetch" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.voice.v1.dialing_permissions \
                      .settings().fetch()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://voice.twilio.com/v1/Settings',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "dialing_permissions_inheritance": true,
          "url": "https://voice.twilio.com/v1/Settings"
      }
      ]
    ))

    actual = @client.voice.v1.dialing_permissions \
                             .settings().fetch()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.voice.v1.dialing_permissions \
                      .settings().update()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://voice.twilio.com/v1/Settings',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "dialing_permissions_inheritance": true,
          "url": "https://voice.twilio.com/v1/Settings"
      }
      ]
    ))

    actual = @client.voice.v1.dialing_permissions \
                             .settings().update()

    expect(actual).to_not eq(nil)
  end
end
