require 'spec_helper'

module GA
 describe Authenticator do
   let(:user_code){ 'a9xfwk9c' }
   let(:verification_url){ 'http://www.google.com/device' }
   let(:valid_info){{
     'device_code' => '4/L9fTtLrhY96442SEuf1Rl3KLFg3y',
     'user_code' => user_code,
     'verification_url' => verification_url,
     'expires_in' => 1800,
     'interval' => 5
   }}
   let(:authenticator){ GA::Authenticator.new(valid_info) }

   context '#authenticate_directions' do
     let(:it){ authenticator.authenticate_directions }

     it 'should contain the user code' do
       it.should include(user_code)
     end

     it 'should contain the verification url' do
       it.should include(verification_url)
     end
   end
 end
end
