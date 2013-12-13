require 'oauth2'
require 'httparty'

module GA 
  class Authentication

    DEFAULT_OPTS = {
      :client => '',
      :secret => '',
      :authorize_url => 'https://accounts.google.com/o/oauth2/device/code',
      :token_url => 'https://accounts.google.com/o/oauth2/token'
    }

    attr_reader :client

    ##
    # @param [Hash] opts
    # @option opts [String] :client Google API Client ID
    # @option opts [String] :secret Google API Client secret key
    # @option opts [String] :authorize_url Oauth url to auth to
    # @option opts [String] :token_url Oauth url for the token
    def initialize(opts={})
      params = DEFAULT_OPTS.merge opts
      @client = OAuth2::Client.new(params.delete(:client), params.delete(:secret), params)
      @params = DEFAULT_OPTS.merge opts
    end

    def authorize_url
      client.auth_code.authorize_url(response_type: nil,scope: 'https://www.googleapis.com/auth/analytics.readonly')
    end

    def verification_information
      @verification_information ||= JSON.parse http_post(authorize_url)
    end

    def token_url(device_code)
      @client.token_url code: device_code,
                        client_id: @params[:client],
                        client_secret: @params[:secret],
                        grant_type: 'http://oauth.net/grant_type/device/1.0'
    end

    def http_post(url)
      HTTParty.post(url).body
    end

  end
end
