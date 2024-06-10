# frozen_string_literal: true

require "dubs/version"
require "dubs/client"
require "dubs/config"

module Dubs
  class Error < StandardError; end
  
  def self.config
    Config.new
  end
end
