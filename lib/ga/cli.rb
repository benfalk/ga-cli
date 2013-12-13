require 'ga/authentication'
require 'ga/authenticator'
require 'ga/token_fetcher'
require 'ga/cli/version'

module GA

  CLIENT_ID = '907505740513-1upteasr68db0cofvhtb9iho3v38a4bi.apps.googleusercontent.com'
  SECRET_KEY = '-BlbTszIyqVaLitbAjMb2sq0'

  module Cli
    AUTH = Authentication.new client: CLIENT_ID, secret: SECRET_KEY

  end
end
