module Riot
  module Lol
    class ChampionMasteryRequest < Request

      def self.api_version
        "v4"
      end

      def find_all(id)
        perform_request(api_url("/champion-masteries/by-summoner/#{id}"))
      end

      def find_by_champion_id(id, champion_id)
        perform_request(api_url("/champion-masteries/by-summoner/#{id}/by-champion/#{champion_id}"))
      end

      def total_score(id)
        perform_request(api_url("/scores/by-summoner/#{id}"))
      end

      private

      def api_base_path
        "/lol/champion-mastery/#{self.class.api_version}"
      end
    end
  end
end