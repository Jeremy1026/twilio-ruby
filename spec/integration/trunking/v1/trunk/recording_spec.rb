##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Recording' do
  it "can fetch" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.trunking.v1.trunks('TKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                         .recordings().fetch()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://trunking.twilio.com/v1/Trunks/TKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Recording',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "mode": "do-not-record",
          "trim": "do-not-trim"
      }
      ]
    ))

    actual = @client.trunking.v1.trunks('TKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                .recordings().fetch()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.trunking.v1.trunks('TKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                         .recordings().update()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://trunking.twilio.com/v1/Trunks/TKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Recording',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "mode": "do-not-record",
          "trim": "do-not-trim"
      }
      ]
    ))

    actual = @client.trunking.v1.trunks('TKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                .recordings().update()

    expect(actual).to_not eq(nil)
  end
end
