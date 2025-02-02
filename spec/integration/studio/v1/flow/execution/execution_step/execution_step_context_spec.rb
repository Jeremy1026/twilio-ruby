##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'ExecutionStepContext' do
  it "can fetch" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.studio.v1.flows('FWXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .executions('FNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .steps('FTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .step_context().fetch()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://studio.twilio.com/v1/Flows/FWXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Executions/FNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Steps/FTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Context',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "context": {
              "foo": "bar"
          },
          "flow_sid": "FWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "execution_sid": "FNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "step_sid": "FTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "url": "https://studio.twilio.com/v1/Flows/FWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Executions/FNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Steps/FTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Context"
      }
      ]
    ))

    actual = @client.studio.v1.flows('FWXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .executions('FNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .steps('FTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .step_context().fetch()

    expect(actual).to_not eq(nil)
  end
end
