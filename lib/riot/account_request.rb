module Riot
  class AccountRequest < Request

    def self.api_version
      "v1"
    end

    def self.platforms
      {
        :br   => 'americas',
        :eune => 'europe',
        :euw  => 'europe',
        :jp   => 'asia',
        :kr   => 'asia',
        :lan  => 'americas',
        :las  => 'americas',
        :na   => 'americas',
        :oce  => 'asia',
        :ru   => 'europe',
        :tr   => 'europe',
      }
    end

    def find_by_puu_id(puu_id)
      perform_request(api_url("/accounts/by-puuid/#{puu_id}"))
    end

    def find_by_riot_id(riot_id, tag_line="NA1")
      riot_id = CGI.escape(riot_id.downcase.gsub(/\s/, ''))
      path = "/accounts/by-riot-id/#{riot_id}"
      if tag_line
        path += "/#{tag_line}"
      end
      perform_request(api_url(path))
    end

    def active_shard(game, puu_id)
      response = perform_request(api_url("/active-shards/by-game/#{game}/by-puuid/#{puu_id}"))
      response["activeShard"]
    end

    private

    def api_base_path
      "/riot/account/#{self.class.api_version}"
    end
  end
end