require 'oauth2'
require 'httparty'

module GA
  class Authentication
    DEFAULT_OPTS = {
      client: '',
      secret: '',
      authorize_url: 'https://accounts.google.com/o/oauth2/device/code'
    }

    READ_ONLY_SCOPE = 'https://www.googleapis.com/auth/analytics.readonly'

    attr_reader :client

    ##
    # @param [Hash] opts
    # @option opts [String] :client Google API Client ID
    # @option opts [String] :secret Google API Client secret key
    # @option opts [String] :authorize_url Oauth url to auth to
    def initialize(opts = {})
      params = DEFAULT_OPTS.merge opts
      @client = OAuth2::Client.new(params.delete(:client), params.delete(:secret), params)
      @params = DEFAULT_OPTS.merge opts
    end

    def authorize_url
      client.auth_code.authorize_url(response_type: nil, scope: READ_ONLY_SCOPE).gsub('response_type=', '')
    end

    def verification_information
      @verification_information ||= JSON.parse http_post(authorize_url)
    end

    def http_post(url)
      HTTParty.post(url).body
    end
  end
end
