# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ku_fu/version"

Gem::Specification.new do |s|
  s.name        = "ku_fu"
  s.version     = KuFu::VERSION
  s.authors     = ["Andrea Campolonghi"]
  s.email       = ["acampolonghi@gmail.com"]
  s.homepage    = ""
  s.summary     = "register who created, updated or deleted an active record object"
  s.description = "register who created, updated or deleted an active record object"

  s.rubyforge_project = "ku_fu"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "activerecord"

  # specify any dependencies here; for example:
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec_junit_formatter"
end
