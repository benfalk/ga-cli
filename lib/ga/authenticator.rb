require 'httparty'

module GA
  class Authenticator

    attr_reader :info

    def initialize(info)
      @info = info
    end

    def authenticate_directions
      "Please visit #{info['verification_url']} and use this key: #{info['user_code']}"
    end

  end
end
