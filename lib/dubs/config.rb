# frozen_string_literal: true

require "anyway_config"

module Dubs
  class Config < Anyway::Config
    attr_config :api_key
    attr_config base_url: "https://api.dub.co"
  end
end