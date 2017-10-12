$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "urlogger/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "urlogger"
  s.version     = Urlogger::VERSION
  s.authors     = ["ivan"]
  s.email       = ["ivan@ivanzhang.ca"]
  s.homepage    = "http://ivanzhang.ca"
  s.summary     = "Logs requests to each url in application."
  s.description = "Logs requests to each url in application."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.4"

  s.add_development_dependency "sqlite3"
end
