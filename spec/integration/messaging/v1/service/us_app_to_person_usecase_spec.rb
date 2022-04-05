##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'UsAppToPersonUsecase' do
  it "can fetch" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.messaging.v1.services('MGXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                          .us_app_to_person_usecases.fetch()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://messaging.twilio.com/v1/Services/MGXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Compliance/Usa2p/Usecases',
    ))).to eq(true)
  end

  it "receives fetch_with_brand_registration_sid responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "us_app_to_person_usecases": [
              {
                  "code": "2FA",
                  "name": "Two-Factor authentication (2FA)",
                  "description": "Two-Factor authentication, one-time use password, password reset",
                  "post_approval_required": false
              },
              {
                  "code": "ACCOUNT_NOTIFICATION",
                  "name": "Account Notification",
                  "description": "All reminders, alerts, and notifications. (Examples include: flight delayed, hotel booked, appointment reminders.)",
                  "post_approval_required": false
              },
              {
                  "code": "AGENTS_FRANCHISES",
                  "name": "Agents and Franchises",
                  "description": "For brands that have multiple agents, franchises or offices in the same brand vertical, but require individual localised numbers per agent/location/office.",
                  "post_approval_required": true
              },
              {
                  "code": "CHARITY",
                  "name": "Charity",
                  "description": "Includes:  5013C Charity\nDoes not include: Religious organizations",
                  "post_approval_required": false
              },
              {
                  "code": "PROXY",
                  "name": "Proxy",
                  "description": "Peer-to-peer app-based group messaging with proxy/pooled numbers (For example: GroupMe)\nSupporting personalized services and non-exposure of personal numbers for enterprise or A2P communications. (Examples include: Uber and AirBnb.)",
                  "post_approval_required": true
              },
              {
                  "code": "CUSTOMER_CARE",
                  "name": "Customer Care",
                  "description": "All customer care messaging, including account management and support",
                  "post_approval_required": false
              },
              {
                  "code": "DELIVERY_NOTIFICATION",
                  "name": "Delivery Notification",
                  "description": "Information about the status of the delivery of a product or service",
                  "post_approval_required": false
              },
              {
                  "code": "EMERGENCY",
                  "name": "Emergency",
                  "description": "Notification services designed to support public safety / health during natural disasters, armed conflicts, pandemics and other national or regional emergencies",
                  "post_approval_required": true
              },
              {
                  "code": "FRAUD_ALERT",
                  "name": "Fraud Alert Messaging",
                  "description": "Fraud alert notification",
                  "post_approval_required": false
              },
              {
                  "code": "HIGHER_EDUCATION",
                  "name": "Higher Education",
                  "description": "For campaigns created on behalf of Colleges or Universities and will also include School Districts etc that fall outside of any \\"free to the consumer\\" messaging model",
                  "post_approval_required": false
              },
              {
                  "code": "K12_EDUCATION",
                  "name": "K-12 Education",
                  "description": "Campaigns created for messaging platforms that support schools from grades K-12 and distance learning centers. This is not for Post-Secondary schools.",
                  "post_approval_required": true
              },
              {
                  "code": "LOW_VOLUME",
                  "name": "Low Volume Mixed",
                  "description": "Low throughput, any combination of use-cases. Examples include:  test, demo accounts",
                  "post_approval_required": false
              },
              {
                  "code": "MARKETING",
                  "name": "Marketing",
                  "description": "Any communication with marketing and/or promotional content",
                  "post_approval_required": false
              },
              {
                  "code": "MIXED",
                  "name": "Mixed",
                  "description": "Mixed messaging reserved for specific consumer service industry",
                  "post_approval_required": false
              },
              {
                  "code": "POLITICAL",
                  "name": "Political",
                  "description": "Part of organized effort to influence decision making of specific group. All campaigns to be verified",
                  "post_approval_required": false
              },
              {
                  "code": "POLLING_VOTING",
                  "name": "Polling and voting",
                  "description": "Polling and voting",
                  "post_approval_required": false
              },
              {
                  "code": "PUBLIC_SERVICE_ANNOUNCEMENT",
                  "name": "Public Service Announcement",
                  "description": "An informational message that is meant to raise the audience awareness about an important issue",
                  "post_approval_required": false
              },
              {
                  "code": "SECURITY_ALERT",
                  "name": "Security Alert",
                  "description": "A notification that the security of a system, either software or hardware, has been compromised in some way and there is an action you need to take",
                  "post_approval_required": false
              },
              {
                  "code": "SOCIAL",
                  "name": "Social",
                  "description": "Communication within or between closed communities (For example: influencers alerts)",
                  "post_approval_required": true
              },
              {
                  "code": "SWEEPSTAKE",
                  "name": "Sweepstake",
                  "description": "Sweepstake",
                  "post_approval_required": true
              }
          ]
      }
      ]
    ))

    actual = @client.messaging.v1.services('MGXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                 .us_app_to_person_usecases.fetch()

    expect(actual).to_not eq(nil)
  end

  it "receives fetch_without_brand_registration_sid responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "us_app_to_person_usecases": [
              {
                  "code": "2FA",
                  "name": "Two-Factor authentication (2FA)",
                  "description": "Two-Factor authentication, one-time use password, password reset",
                  "post_approval_required": false
              },
              {
                  "code": "ACCOUNT_NOTIFICATION",
                  "name": "Account Notification",
                  "description": "All reminders, alerts, and notifications. (Examples include: flight delayed, hotel booked, appointment reminders.)",
                  "post_approval_required": false
              },
              {
                  "code": "AGENTS_FRANCHISES",
                  "name": "Agents and Franchises",
                  "description": "For brands that have multiple agents, franchises or offices in the same brand vertical, but require individual localised numbers per agent/location/office.",
                  "post_approval_required": true
              },
              {
                  "code": "CHARITY",
                  "name": "Charity",
                  "description": "Includes:  5013C Charity\nDoes not include: Religious organizations",
                  "post_approval_required": false
              },
              {
                  "code": "PROXY",
                  "name": "Proxy",
                  "description": "Peer-to-peer app-based group messaging with proxy/pooled numbers (For example: GroupMe)\nSupporting personalized services and non-exposure of personal numbers for enterprise or A2P communications. (Examples include: Uber and AirBnb.)",
                  "post_approval_required": true
              },
              {
                  "code": "CUSTOMER_CARE",
                  "name": "Customer Care",
                  "description": "All customer care messaging, including account management and support",
                  "post_approval_required": false
              },
              {
                  "code": "DELIVERY_NOTIFICATION",
                  "name": "Delivery Notification",
                  "description": "Information about the status of the delivery of a product or service",
                  "post_approval_required": false
              },
              {
                  "code": "EMERGENCY",
                  "name": "Emergency",
                  "description": "Notification services designed to support public safety / health during natural disasters, armed conflicts, pandemics and other national or regional emergencies",
                  "post_approval_required": true
              },
              {
                  "code": "FRAUD_ALERT",
                  "name": "Fraud Alert Messaging",
                  "description": "Fraud alert notification",
                  "post_approval_required": false
              },
              {
                  "code": "HIGHER_EDUCATION",
                  "name": "Higher Education",
                  "description": "For campaigns created on behalf of Colleges or Universities and will also include School Districts etc that fall outside of any \\"free to the consumer\\" messaging model",
                  "post_approval_required": false
              },
              {
                  "code": "K12_EDUCATION",
                  "name": "K-12 Education",
                  "description": "Campaigns created for messaging platforms that support schools from grades K-12 and distance learning centers. This is not for Post-Secondary schools.",
                  "post_approval_required": true
              },
              {
                  "code": "LOW_VOLUME",
                  "name": "Low Volume Mixed",
                  "description": "Low throughput, any combination of use-cases. Examples include:  test, demo accounts",
                  "post_approval_required": false
              },
              {
                  "code": "MARKETING",
                  "name": "Marketing",
                  "description": "Any communication with marketing and/or promotional content",
                  "post_approval_required": false
              },
              {
                  "code": "MIXED",
                  "name": "Mixed",
                  "description": "Mixed messaging reserved for specific consumer service industry",
                  "post_approval_required": false
              },
              {
                  "code": "POLITICAL",
                  "name": "Political",
                  "description": "Part of organized effort to influence decision making of specific group. All campaigns to be verified",
                  "post_approval_required": false
              },
              {
                  "code": "POLLING_VOTING",
                  "name": "Polling and voting",
                  "description": "Polling and voting",
                  "post_approval_required": false
              },
              {
                  "code": "PUBLIC_SERVICE_ANNOUNCEMENT",
                  "name": "Public Service Announcement",
                  "description": "An informational message that is meant to raise the audience awareness about an important issue",
                  "post_approval_required": false
              },
              {
                  "code": "SECURITY_ALERT",
                  "name": "Security Alert",
                  "description": "A notification that the security of a system, either software or hardware, has been compromised in some way and there is an action you need to take",
                  "post_approval_required": false
              },
              {
                  "code": "SOCIAL",
                  "name": "Social",
                  "description": "Communication within or between closed communities (For example: influencers alerts)",
                  "post_approval_required": true
              },
              {
                  "code": "SWEEPSTAKE",
                  "name": "Sweepstake",
                  "description": "Sweepstake",
                  "post_approval_required": true
              }
          ]
      }
      ]
    ))

    actual = @client.messaging.v1.services('MGXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                 .us_app_to_person_usecases.fetch()

    expect(actual).to_not eq(nil)
  end
end
