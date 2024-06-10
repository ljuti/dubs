# frozen_string_literal: true

require_relative "lib/dubs/version"

Gem::Specification.new do |spec|
  spec.name = "dubs"
  spec.version = Dubs.gem_version
  spec.authors = ["Lauri Jutila"]
  spec.email = ["git@laurijutila.com"]

  spec.summary = "Ruby gem for interacting with Dub.co API"
  spec.description = "Ruby gem for interacting with Dub.co API"
  spec.homepage = "https://github.com/ljuti/dubs"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ljuti/dubs"
  spec.metadata["changelog_uri"] = "https://github.com/ljuti/dubs/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "anyway_config", "~> 2.0"
  spec.add_dependency "faraday", "~> 2"

  spec.add_development_dependency "webmock"
  spec.add_development_dependency "vcr"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
