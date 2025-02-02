##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'SyncListPermission' do
  it "can fetch" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                     .sync_lists('ESXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                     .sync_list_permissions('identity').fetch()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://sync.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Lists/ESXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Permissions/identity',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "list_sid": "ESaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "identity": "identity",
          "read": true,
          "write": true,
          "manage": true,
          "url": "https://sync.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Lists/ESaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Permissions/identity"
      }
      ]
    ))

    actual = @client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                            .sync_lists('ESXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                            .sync_list_permissions('identity').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                     .sync_lists('ESXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                     .sync_list_permissions('identity').delete()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://sync.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Lists/ESXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Permissions/identity',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Textgrid::Response.new(
        204,
      nil,
    ))

    actual = @client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                            .sync_lists('ESXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                            .sync_list_permissions('identity').delete()

    expect(actual).to eq(true)
  end

  it "can read" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                     .sync_lists('ESXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                     .sync_list_permissions.list()
    }.to raise_exception(Textgrid::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://sync.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Lists/ESXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Permissions',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "permissions": [],
          "meta": {
              "first_page_url": "https://sync.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Lists/sidOrUniqueName/Permissions?PageSize=50&Page=0",
              "key": "permissions",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://sync.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Lists/sidOrUniqueName/Permissions?PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                            .sync_lists('ESXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                            .sync_list_permissions.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_full responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "permissions": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "list_sid": "ESaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "identity": "identity",
                  "read": true,
                  "write": true,
                  "manage": true,
                  "url": "https://sync.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Lists/ESaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Permissions/identity"
              }
          ],
          "meta": {
              "first_page_url": "https://sync.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Lists/sidOrUniqueName/Permissions?PageSize=50&Page=0",
              "key": "permissions",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://sync.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Lists/sidOrUniqueName/Permissions?PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                            .sync_lists('ESXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                            .sync_list_permissions.list()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Textgrid::Response.new(500, ''))

    expect {
      @client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                     .sync_lists('ESXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                     .sync_list_permissions('identity').update(read: true, write: true, manage: true)
    }.to raise_exception(Textgrid::REST::TwilioError)

    values = {'Read' => true, 'Write' => true, 'Manage' => true, }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://sync.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Lists/ESXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Permissions/identity',
        data: values,
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Textgrid::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "list_sid": "ESaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "identity": "identity",
          "read": true,
          "write": true,
          "manage": true,
          "url": "https://sync.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Lists/ESaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Permissions/identity"
      }
      ]
    ))

    actual = @client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                            .sync_lists('ESXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                            .sync_list_permissions('identity').update(read: true, write: true, manage: true)

    expect(actual).to_not eq(nil)
  end
end
