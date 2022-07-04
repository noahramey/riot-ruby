require "uri"

module Riot
  class NotFound < StandardError; end
  class TooManyRequests < StandardError; end

  class Request
    include HTTParty
    attr_accessor :api_key, :game, :region

    def self.api_version
      "v4"
    end

    def self.platforms
      {
        :br   => 'br1',
        :eune => 'eun1',
        :euw  => 'euw1',
        :jp   => 'jp1',
        :kr   => 'kr',
        :lan  => 'la1',
        :las  => 'la2',
        :na   => 'na1',
        :oce  => 'oc1',
        :ru   => 'ru',
        :tr   => 'tr1',
      }
    end

    def initialize(api_key, game, region)
      @api_key = api_key
      @game = game
      @region = region
    end

    def platform
      self.class.platforms[region.downcase.to_sym]
    end

    def api_version
      self.class.api_version
    end

    def api_url(path, params={})
      url = "#{api_base_url}#{api_base_path}#{path}"
      "#{url}?#{api_query_string(params)}"
    end

    def api_base_url
      "https://#{platform}.api.riotgames.com"
    end

    # overwrite this on subclasses
    def api_base_path
      ""
    end

    def api_query_string(params={})
      URI.encode_www_form(params.merge(api_key: api_key))
    end

    def perform_request(url, options={})
      options[:headers] ||= {}
      options[:headers].merge!({
                                 "Content-Type" => "application/json",
                                 "Accept"       => "application/json"
                               })
      response = self.class.get(url, options)

      if response.respond_to?(:code) && !(200...300).include?(response.code)
        raise NotFound.new("404 Not Found") if response.not_found?
        raise TooManyRequests.new('429 Rate limit exceeded') if response.code == 429
      end

      if response.respond_to?(:parsed_response)
        response.parsed_response
      else
        JSON.parse(response)
      end
    end
  end
end