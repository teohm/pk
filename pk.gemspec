# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pk/version'

Gem::Specification.new do |gem|
  gem.name          = "pk"
  gem.version       = Pk::VERSION
  gem.authors       = ["Huiming Teo"]
  gem.email         = ["teohuiming@gmail.com"]
  gem.description   = %q{Command line tool to collect and print public keys.}
  gem.summary       = %q{CLI tool to collect and print public keys.}
  gem.homepage      = "https://github.com/teohm/pk"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "thor"
end
