##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'CurrentCall' do
  it "can fetch" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.preview.trusted_comms.current_calls().fetch(x_xcnam_sensitive_phone_number_from: 'x_xcnam_sensitive_phone_number_from', x_xcnam_sensitive_phone_number_to: 'x_xcnam_sensitive_phone_number_to')
    }.to raise_exception(Textgrid::REST::TwilioError)

    headers = {
        'X-Xcnam-Sensitive-Phone-Number-From' => 'x_xcnam_sensitive_phone_number_from',
        'X-Xcnam-Sensitive-Phone-Number-To' => 'x_xcnam_sensitive_phone_number_to',
    }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://preview.twilio.com/TrustedComms/CurrentCall',
        headers: headers,
    ))).to eq(true)
  end

  it "receives read_found responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "bg_color": "#fff",
          "caller": "Owl Bank",
          "created_at": "2019-05-01T20:00:00Z",
          "font_color": "#f22f46",
          "from": "+1500123",
          "logo": "https://www.twilio.com/marketing/bundles/company/img/logos/red/twilio-logo-red.png",
          "manager": "Twilio",
          "reason": "Hello Jhon, your bank appointment has been confirmed.",
          "shield_img": "https://www.twilio.com/marketing/bundles/company/img/badges/red/twilio-badge-red.png",
          "sid": "CQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "status": "ringing",
          "to": "+1500456",
          "url": "https://preview.twilio.com/TrustedComms/CurrentCall",
          "use_case": "conversational"
      }
      ]
    ))

    actual = @client.preview.trusted_comms.current_calls().fetch()

    expect(actual).to_not eq(nil)
  end
end
