module Riot
  class SummonerRequest < Request

    def find_by_name(name)
      name = CGI.escape name.downcase.gsub(/\s/, '')
      perform_request(api_url("/summoners/by-name/#{name}"))
    end

    private

    def api_base_path
      "/lol/summoner/#{self.class.api_version}"
    end
  end
end