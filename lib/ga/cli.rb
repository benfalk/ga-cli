require 'ga/authentication'
require 'ga/authenticator'
require 'ga/token_fetcher'
require 'ga/user'
require 'ga/cli/version'
require 'legato'

module GA
  module Cli
    CLIENT_ID = '907505740513-1upteasr68db0cofvhtb9iho3v38a4bi.apps.googleusercontent.com'
    SECRET_KEY = '-BlbTszIyqVaLitbAjMb2sq0'
    AUTH = Authentication.new client: CLIENT_ID, secret: SECRET_KEY
  end
end
