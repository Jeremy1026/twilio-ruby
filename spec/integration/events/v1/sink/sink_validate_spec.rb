##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'SinkValidate' do
  it "can create" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.events.v1.sinks('DGXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .sink_validate.create(test_id: 'test_id')
    }.to raise_exception(Textgrid::REST::TwilioError)

    values = {'TestId' => 'test_id', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://events.twilio.com/v1/Sinks/DGXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Validate',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Textgrid::Response.new(
        201,
      %q[
      {
          "result": "valid"
      }
      ]
    ))

    actual = @client.events.v1.sinks('DGXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .sink_validate.create(test_id: 'test_id')

    expect(actual).to_not eq(nil)
  end
end
