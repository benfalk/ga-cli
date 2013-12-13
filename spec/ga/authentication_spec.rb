require 'spec_helper'

module GA
  describe Authentication do
    let(:client_id){ 'CLIENT_ID' }
    let(:secret){ 'CLIENT_SECRET' }
    let(:auth){ Authentication.new(client: client_id, secret: secret) }

    describe '#authorize_url' do
      let(:it){ auth.authorize_url }

      it 'should be a string' do
        it.should be_a(String)
      end

      it 'should contain the client id' do
        it.should include(client_id)
      end

      it 'should contain https' do
        it.should include('https://')
      end

      it 'should not have a response type specified' do
        it.should_not include('response_type=')
      end
    end

    describe '#verification_information' do
      let(:verification){{
        'device_code'      => 'DEVICE_CODE',
        'user_code'        => 'USER_CODE',
        'verification_url' => 'VERIFICATION_URL',
        'expires_in'       => 1800,
        'interval'         => 5
      }}
      let(:verification_string){ verification.to_json }
      let(:it){ auth.verification_information }

      before(:each) do
        auth.should_receive(:http_post).and_return(verification_string)
      end

      it 'should provid hash information' do
        it.should eq(verification)
      end
    end

    describe '#token_url' do
      let(:device_code){ 'DEVICE_CODE' }
      let(:it){ auth.token_url(device_code) }

      it 'should contain the device code' do
        it.should include(device_code)
      end

      it 'should have a https' do
        it.should include('https://')
      end

      it 'should have a grant type' do
        it.should include('grant_type=')
      end
    end
  end
end
