require 'active_support/core_ext/string/inflections'
require 'httparty'
require 'uri'

module Riot
  module Lol; end
  module Val; end
  module Tft; end
end

require 'riot/client'
require 'riot/request'
require 'riot/account_request'
require 'riot/lol/summoner_request'
require 'riot/lol/champion_mastery_request'
require 'riot/lol/champion_request'