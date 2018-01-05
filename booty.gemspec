$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "booty/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "booty-rails"
  s.version     = BootyRails::VERSION
  s.authors     = ["tayden-miller"]
  s.email       = ["tayden007@hotmail.com"]
  s.homepage    = "https://github.com/tayden-miller/booty"
  s.summary     = "A form builder with Bootstrap."
  s.description = "Bootstrap styles without the fuss."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 5.0.0"
  s.add_dependency "bootstrap", "4.0.0.beta3"

end
