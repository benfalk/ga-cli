require 'spec_helper'

module GA
  describe Authenticator do
    let(:user_code) { 'a9xfwk9c' }
    let(:verification_url) { 'http://www.google.com/device' }
    let(:valid_info)do
      {
        'device_code' => '4/L9fTtLrhY96442SEuf1Rl3KLFg3y',
        'user_code' => user_code,
        'verification_url' => verification_url,
        'expires_in' => 1800,
        'interval' => 5
      }
    end
    let(:auth) { double(:auth) }
    let(:authenticator) { GA::Authenticator.new(valid_info, auth) }
    let(:grant_string)do
      <<-eos
       {
         "access_token" : "ya29.AHES6ZSuY8f6WFLswSv0HELP2J4cCvFSj-8GiZM0Pr6cgXU",
         "token_type" : "Bearer",
         "expires_in" : 3600,
         "refresh_token" : "1/551G1yXUqgkDGnkfFk6ZbjMLMDIMxo3JFc8lY8CAR-Q"
       }
     eos
    end
    let(:pending_string)do
      <<-eos
       {
         "error" : "authorization_pending"
       }
     eos
    end

    context '#directions' do
      let(:it) { authenticator.directions }

      it 'should contain the user code' do
        it.should include(user_code)
      end

      it 'should contain the verification url' do
        it.should include(verification_url)
      end
    end

    context '#listen_for_auth' do
      it 'should post out with the authentication' do
        auth.stub_chain(:client, :id).and_return('id')
        auth.stub_chain(:client, :secret).and_return('secret')
        authenticator.should_receive(:http_post).and_return(grant_string)
        authenticator.listen_for_auth
      end
    end
  end
end
