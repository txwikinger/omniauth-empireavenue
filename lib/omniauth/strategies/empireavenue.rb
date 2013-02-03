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
        super
      end

      uid{ raw_info['ticker'] }

      info do
        {
          :ticker => raw_info['ticker'],
          :first_name => raw_info['first_name'],
          :last_name => raw_info['last_name'],
          :full_name => raw_info['full_name'],
          :ticker => raw_info['ticker'],
          :location => [raw_info['location'], raw_info['country']].reject{|v| !v || v.empty?}.join(', ')
        }
      end

      extra do
        { 'raw_info' => raw_info }
      end

      def raw_info
        @raw_info ||= JSON.parse(access_token.get("https://api.empireavenue.com/profile/info?access_token=#{access_token.token}&client_id=#{client_id}").body)
      end

    end
  end
end
