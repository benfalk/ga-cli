require 'httparty'

module GA
  class Authenticator
    attr_reader :info, :auth

    def initialize(info, auth)
      @info = info
      @auth = auth
    end

    def directions
      "Please visit #{info['verification_url']} and use this key: #{info['user_code']}"
    end

    def listen_for_auth
      check = check_auth
      while check['error'] && check['error'] == 'authorization_pending'
        sleep info['interval']
        check = check_auth
      end
      check
    end

    private

    def check_auth
      JSON.parse http_post(token_url, token_data)
    end

    def token_data
      {
        'client_id' => auth.client.id,
        'client_secret' => auth.client.secret,
        'grant_type' => 'http://oauth.net/grant_type/device/1.0',
        'code' => info['device_code']
      }
    end

    def token_url
      'https://accounts.google.com/o/oauth2/token'
    end

    def http_post(url, data = {})
      HTTParty.post(url, body: data).body
    end
  end
end
