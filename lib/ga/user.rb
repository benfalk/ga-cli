module GA
  class User

    attr_reader :access_token, :legato_user

    def initialize(token, opts={})
      client = opts.fetch(:client){ GA::Cli::AUTH.client }
      @access_token = OAuth2::AccessToken.from_hash client, token
      @legato_user = Legato::User.new @access_token
    end

    def websites
      profiles.map{ |p| "#{p.web_property_id}  :: #{p.attributes['websiteUrl']}" }
    end

    def profile(p)
      profiles.find{ |pro| pro.web_property_id == p }
    end

    # By default delgate everything to the legato user
    def method_missing(method,*args,&block)
      legato_user.send(method,*args,&block)
    end

  end
end
