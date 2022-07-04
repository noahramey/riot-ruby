module Riot
  class Client
    attr_reader :api_key, :region

    def initialize(api_key, region)
      @api_key = api_key
      @region = region
    end

    def account
      @account_request ||= AccountRequest.new(api_key, '', region)
    end

    def summoner
      @summoner_request ||= Lol::SummonerRequest.new(api_key, 'lol', region)
    end
  end
end
