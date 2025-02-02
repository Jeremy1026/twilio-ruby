##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'WorkersRealTimeStatistics' do
  it "can fetch" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.taskrouter.v1.workspaces('WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                           .workers('WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                           .real_time_statistics().fetch()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://taskrouter.twilio.com/v1/Workspaces/WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Workers/RealTimeStatistics',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workers/RealTimeStatistics",
          "total_workers": 15,
          "activity_statistics": [
              {
                  "friendly_name": "Idle",
                  "workers": 0,
                  "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              },
              {
                  "friendly_name": "Busy",
                  "workers": 9,
                  "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              },
              {
                  "friendly_name": "Offline",
                  "workers": 6,
                  "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              },
              {
                  "friendly_name": "Reserved",
                  "workers": 0,
                  "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              }
          ]
      }
      ]
    ))

    actual = @client.taskrouter.v1.workspaces('WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                  .workers('WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                  .real_time_statistics().fetch()

    expect(actual).to_not eq(nil)
  end
end
