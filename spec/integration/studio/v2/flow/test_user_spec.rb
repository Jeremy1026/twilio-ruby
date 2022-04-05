##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'FlowTestUser' do
  it "can fetch" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.studio.v2.flows('FWXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .test_users().fetch()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://studio.twilio.com/v2/Flows/FWXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/TestUsers',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "sid": "FWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "test_users": [
              "user1",
              "user2"
          ],
          "url": "https://studio.twilio.com/v2/Flows/FWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/TestUsers"
      }
      ]
    ))

    actual = @client.studio.v2.flows('FWXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .test_users().fetch()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.studio.v2.flows('FWXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .test_users().update(test_users: ['test_users'])
    }.to raise_exception(Textgrid::REST::TwilioError)

    values = {'TestUsers' => Twilio.serialize_list(['test_users']) { |e| e }, }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://studio.twilio.com/v2/Flows/FWXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/TestUsers',
        data: values,
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "sid": "FWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "test_users": [
              "user1",
              "user2"
          ],
          "url": "https://studio.twilio.com/v2/Flows/FWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/TestUsers"
      }
      ]
    ))

    actual = @client.studio.v2.flows('FWXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .test_users().update(test_users: ['test_users'])

    expect(actual).to_not eq(nil)
  end
end
