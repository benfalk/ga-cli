require 'spec_helper'

module GA
  describe User do

    let(:oauth_client) { double(:client) }
    let(:oauth_token) { double(:token) }

    it 'is initialized with an access token and an optional oauth client' do
      oauth_token.as_null_object
      User.new(oauth_token, client: oauth_client)
    end

  end
end
