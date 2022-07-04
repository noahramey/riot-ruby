module Riot
  module Lol
    class ChampionRequest < Request

      def self.api_version
        "v3"
      end

      def champion_rotations
        perform_request(api_url("/champion-rotations"))
      end

      private

      def api_base_path
        "/lol/platform/#{self.class.api_version}"
      end
    end
  end
end