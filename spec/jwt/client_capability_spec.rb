require 'spec_helper'

describe Textgrid::JWT::ClientCapability do
  describe 'initialization' do
    it 'should initialize without optionals' do
      clientCapability = Textgrid::JWT::ClientCapability.new 'accountSid', 'authToken'
      expect(clientCapability.instance_variable_get('@account_sid')).to eq('accountSid')
      expect(clientCapability.instance_variable_get('@auth_token')).to eq('authToken')
      expect(clientCapability.instance_variable_get('@client_name')).to be_nil
      expect(clientCapability.instance_variable_get('@scopes')).to eq([])
    end
  end

  describe 'ClientCapability scopes' do
    before :each do
      @clientCapability = Textgrid::JWT::ClientCapability.new 'accountSid', 'authToken'
    end

    it 'no capabilities' do
      expect(@clientCapability.__send__(:_generate_payload)[:scope]).to eq('')
    end

    it 'OutgoingClientScope sans params, client name' do
      @outgoingScope = Textgrid::JWT::ClientCapability::OutgoingClientScope.new('test-application-sid')
      @clientCapability.add_scope(@outgoingScope)
      escope = 'scope:client:outgoing?appSid=test-application-sid'
      expect(@clientCapability.__send__(:_generate_payload)[:scope]).to eq(escope)
    end

    it 'OutgoingClientScope with client-name' do
      @outgoingScope = Textgrid::JWT::ClientCapability::OutgoingClientScope.new('test-application-sid', 'test-client-name')
      @clientCapability.add_scope(@outgoingScope)
      escope = 'scope:client:outgoing?appSid=test-application-sid&clientName=test-client-name'
      expect(@clientCapability.__send__(:_generate_payload)[:scope]).to eq(escope)
    end

    it 'OutgoingClientScope with params' do
      @outgoingScope = Textgrid::JWT::ClientCapability::OutgoingClientScope.new('test-application-sid', nil, {'params_key'=>'param_value'})
      @clientCapability.add_scope(@outgoingScope)
      escope = 'scope:client:outgoing?appSid=test-application-sid&appParams=params_key%3Dparam_value'
      expect(@clientCapability.__send__(:_generate_payload)[:scope]).to eq(escope)
    end

    it 'IncomingClientScope' do
      @incomingScope = Textgrid::JWT::ClientCapability::IncomingClientScope.new('test-client-name')
      @clientCapability.add_scope(@incomingScope)
      escope = 'scope:client:incoming?clientName=test-client-name'
      expect(@clientCapability.__send__(:_generate_payload)[:scope]).to eq(escope)
    end

    it 'EventStreamScope sans filters' do
      @eventStreamScope = Textgrid::JWT::ClientCapability::EventStreamScope.new
      @clientCapability.add_scope(@eventStreamScope)
      escope = 'scope:stream:subscribe?path=%2F2010-04-01%2FEvents'
      expect(@clientCapability.__send__(:_generate_payload)[:scope]).to eq(escope)
    end

    it 'EventStreamScope with filters' do
      @eventStreamScope = Textgrid::JWT::ClientCapability::EventStreamScope.new({'param_key'=>'param_value'})
      @clientCapability.add_scope(@eventStreamScope)
      escope = 'scope:stream:subscribe?path=%2F2010-04-01%2FEvents&params=param_key%3Dparam_value'
      expect(@clientCapability.__send__(:_generate_payload)[:scope]).to eq(escope)
    end

    it 'OutgoingClientScope and IncomingClientScope' do
      @outgoingScope = Textgrid::JWT::ClientCapability::OutgoingClientScope.new('test-application-sid')
      @clientCapability.add_scope(@outgoingScope)
      @incomingScope = Textgrid::JWT::ClientCapability::IncomingClientScope.new('test-client-name')
      @clientCapability.add_scope(@incomingScope)
      escope = 'scope:client:outgoing?appSid=test-application-sid scope:client:incoming?clientName=test-client-name'
      expect(@clientCapability.__send__(:_generate_payload)[:scope]).to eq(escope)
    end

    it 'complete payload' do
      @incomingScope = Textgrid::JWT::ClientCapability::IncomingClientScope.new('test-client-name')
      @clientCapability.add_scope(@incomingScope)
      payload, _ = ::JWT.decode(@clientCapability.to_s, 'authToken', true, { algorithm: 'HS256' })
      escope = 'scope:client:incoming?clientName=test-client-name'
      expect(payload['iss']).to eq('accountSid')
      expect(payload['scope']).to eq(escope)
      expect(payload['exp']).to be > Time.now.to_i
      expect(payload['nbf']).to be <= Time.now.to_i
    end
  end

  describe 'ClientCapability constructor with scopes' do
    it 'Valid scopes in constructor' do
      @incomingScope = Textgrid::JWT::ClientCapability::IncomingClientScope.new('test-client-name')
      @clientCapability = Textgrid::JWT::ClientCapability.new 'accountSid', 'authToken', scopes: [@incomingScope]
      escope = 'scope:client:incoming?clientName=test-client-name'
      expect(@clientCapability.__send__(:_generate_payload)[:scope]).to eq(escope)
    end
  end
end

describe Textgrid::JWT::Scope do
  it 'Scope raise exception' do
    class DummyScope
      include Textgrid::JWT::Scope
    end
    @dummyScope = DummyScope.new
    expect { @dummyScope._generate_payload }.to raise_error(RuntimeError)
  end
end
