# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

# Why oh why oh what is this?
# See the cuke that is setting this.
# Basically to really reproduce #877 we needed a gemspec that doesn't
# (indirectly) define a SimpleCov module... so this is the workaround.
# No one ever but hat test should set that environment variable. Please.
version =
  if ENV["SIMPLECOV_NO_REQUIRE_VERSION"]
    ENV["SIMPLECOV_NO_REQUIRE_VERSION"]
  else
    require "simplecov/version"
    SimpleCov::VERSION
  end

Gem::Specification.new do |gem|
  gem.name        = "simplecov"
  gem.version     = version
  gem.platform    = Gem::Platform::RUBY
  gem.authors     = ["Emmanuel Cohen-Laroque", "Christoph" Olszowka", "Tobias Pfeiffer"]
  gem.email       = ["ecohen at hexagonalconsulting.com", "christoph at olszowka de", "pragtob@gmail.com"]
  gem.homepage    = "https://github.com/ecl66/simplecov"
  gem.summary     = "Code coverage for Ruby defaulting to nocov"
  gem.description = %(Code coverage for Ruby with a powerful configuration library and automatic merging of coverage across test suites, forked to default to nocov)
  gem.license     = "MIT"
  gem.metadata    = {
    "bug_tracker_uri"   => "https://github.com/simplecov-ruby/simplecov/issues",
    "changelog_uri"     => "https://github.com/simplecov-ruby/simplecov/blob/main/CHANGELOG.md",
    "documentation_uri" => "https://www.rubydoc.info/gems/simplecov/#{gem.version}",
    "mailing_list_uri"  => "https://groups.google.com/forum/#!forum/simplecov",
    "source_code_uri"   => "https://github.com/simplecov-ruby/simplecov/tree/v#{gem.version}"
  }

  gem.required_ruby_version = ">= 2.5.0"

  gem.add_dependency "docile", "~> 1.1"
  gem.add_dependency "simplecov-html", "~> 0.11"
  gem.add_dependency "simplecov_json_formatter", "~> 0.1"

  gem.files         = Dir["{lib}/**/*.*", "bin/*", "LICENSE", "CHANGELOG.md", "README.md", "doc/*"]
  gem.require_paths = ["lib"]
end
