# This is the code you would have
# to put into the google device auth
$DEVICE_CODE = 'xxx'
$USER_CODE = '12345'

module GA
  class Authenticator
    private
    def http_post(url,data={})
        if data['code'] == $DEVICE_CODE
          <<-eos
           {
             "access_token" : "ya29.AHES6ZSuY8f6WFLswSv0HELP2J4cCvFSj-8GiZM0Pr6cgXU",
             "token_type" : "Bearer",
             "expires_in" : 3600,
             "refresh_token" : "1/551G1yXUqgkDGnkfFk6ZbjMLMDIMxo3JFc8lY8CAR-Q"
           }
          eos
        end
    end
  end

  class Authentication
    private
    def http_post(url)
      {
        'device_code'      => $DEVICE_CODE,
        'user_code'        => $USER_CODE,
        'verification_url' => 'http://www.google.com/device',
        'expires_in'       => 1800,
        'interval'         => 1
      }.to_json
    end
  end

end
