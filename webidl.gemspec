# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "webidl/version"

Gem::Specification.new do |s|
  s.name        = "webidl"
  s.version     = WebIDL::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jari Bakken"]
  s.email       = ["jari.bakken@gmail.com"]
  s.homepage    = "http://github.com/jarib/webidl"
  s.summary     = %q{Ruby parser for WebIDL}
  s.description = %q{Built on Treetop, this gem will parse interface declarations in WebIDL and generate ruby code}

  s.rubyforge_project = "webidl"

  s.add_runtime_dependency "treetop"
  s.add_runtime_dependency "ruby2ruby"
  s.add_development_dependency "rspec", "~> 2.5"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
