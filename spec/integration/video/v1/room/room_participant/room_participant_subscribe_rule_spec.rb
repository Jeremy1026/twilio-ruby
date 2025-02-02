##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'SubscribeRules' do
  it "can fetch" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.video.v1.rooms('RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                      .participants('PAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                      .subscribe_rules.fetch()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://video.twilio.com/v1/Rooms/RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants/PAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/SubscribeRules',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "participant_sid": "PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "room_sid": "RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": null,
          "date_updated": null,
          "rules": [
              {
                  "type": "include",
                  "all": true,
                  "publisher": null,
                  "track": null,
                  "kind": null,
                  "priority": null
              }
          ]
      }
      ]
    ))

    actual = @client.video.v1.rooms('RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .participants('PAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .subscribe_rules.fetch()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.video.v1.rooms('RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                      .participants('PAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                      .subscribe_rules.update()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://video.twilio.com/v1/Rooms/RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants/PAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/SubscribeRules',
    ))).to eq(true)
  end

  it "receives update_filters responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "participant_sid": "PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "room_sid": "RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": null,
          "date_updated": null,
          "rules": [
              {
                  "type": "exclude",
                  "all": true,
                  "publisher": null,
                  "track": null,
                  "kind": null,
                  "priority": null
              }
          ]
      }
      ]
    ))

    actual = @client.video.v1.rooms('RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .participants('PAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .subscribe_rules.update()

    expect(actual).to_not eq(nil)
  end
end
