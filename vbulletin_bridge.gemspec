# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vbulletin_bridge/version'

Gem::Specification.new do |spec|
  spec.name          = "Vbulletin Bridge"
  spec.version       = VbulletinBridge::VERSION
  spec.authors       = ["Mark Gandolfo"]
  spec.email         = ["mark@gandolfo.com.au"]
  spec.description   = %q{A list of models to access a vbulletin database, includes auth algorithm}
  spec.summary       = %q{A list of models to access a vbulletin database, includes auth algorithm. Simple to use, just include it in your rails/ruby app, and point the DB at your vb app. }
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "turn"
end