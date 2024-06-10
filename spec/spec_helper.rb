# frozen_string_literal: true

require "dubs"
require "webmock/rspec"
require "vcr"
require "async/http/faraday"

VCR.configure do |config|
  config.cassette_library_dir = "spec/vcr"
  config.hook_into :webmock
  config.filter_sensitive_data("<API_KEY>") { Dubs::Config.new.api_key }
end

Anyway::Settings.use_local_files = true

Faraday.default_adapter = :async_http

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
