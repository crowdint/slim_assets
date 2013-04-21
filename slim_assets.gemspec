# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "slim_assets/version"

Gem::Specification.new do |s|
  s.name        = "slim_assets"
  s.version     = SlimAssets::VERSION
  s.authors     = ["David Padilla"]
  s.email       = ["david@crowdint.com"]
  s.homepage    = ""
  s.summary     = %q{Use Slim with Rails helpers in the asset pipeline}
  s.description = %q{Use Slim with Rails helpers in the asset pipeline}

  s.rubyforge_project = "slim_assets"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "slim"
  s.add_runtime_dependency "tilt"

  s.add_development_dependency 'rails', '4.0.0.beta1'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'ejs'
  s.add_development_dependency 'psych'
end
