##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'FunctionVersionContent' do
  it "can fetch" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.serverless.v1.services('ZSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                           .functions('ZHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                           .function_versions('ZNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                           .function_version_content().fetch()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://serverless.twilio.com/v1/Services/ZSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Functions/ZHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Versions/ZNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Content',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "sid": "ZN00000000000000000000000000000000",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "ZS00000000000000000000000000000000",
          "function_sid": "ZH00000000000000000000000000000000",
          "content": "exports.handler = function (context, event, callback) {\n    const request = require(\\"request\\");\n    return request(\\"http://www.google.com\\", function (error, response, body) {\n        callback(null, response.statusCode);\n    });\n};",
          "url": "https://serverless.twilio.com/v1/Services/ZS00000000000000000000000000000000/Functions/ZH00000000000000000000000000000000/Versions/ZN00000000000000000000000000000000/Content"
      }
      ]
    ))

    actual = @client.serverless.v1.services('ZSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                  .functions('ZHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                  .function_versions('ZNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                  .function_version_content().fetch()

    expect(actual).to_not eq(nil)
  end
end
