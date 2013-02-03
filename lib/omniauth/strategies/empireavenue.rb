require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class EmpireAvenue < OmniAuth::Strategies::OAuth2

      # Possible scopes: noauth, profile_read, market_data_read, missions_read 
      DEFAULT_SCOPE = "noauth, profile_read, market_data_read, missions_read"

      option :name, "empireavenue"
      option :authorize_options, [:scope, :approval_prompt, :access_type, :state, :hd]

      option :client_options, {
        :site => "https://www.empireavenue.com",
        :authorize_url => 'https://www.empireavenue.com/profile/developer/authorize',
        :token_url => 'https://api.empireavenue.com/oauth/token'
      }

      def request_phase
        redirect client.auth_code.authorize_url({:state => "request_auth_code", :response_type => "code"})
      end

      uid { access_token.params }

      info do
        {
        }
      end

      extra do
        { 'raw_info' => raw_info }
      end

      def raw_info
        @raw_info = {}
      end

    end
  end
end

OmniAuth.config.add_camelization 'empireavenue', 'EmpireAvenue'
