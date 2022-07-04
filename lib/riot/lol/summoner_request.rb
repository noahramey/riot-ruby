module Riot
  module Lol
    class SummonerRequest < Request

      def find(id)
        perform_request(api_url("/summoners/#{id}"))
      end

      def find_by_account_id(id)
        perform_request(api_url("/summoners/by-account/#{id}"))
      end

      def find_by_puu_id(puu_id)
        perform_request(api_url("/summoners/by-puuid/#{puu_id}"))
      end

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
end