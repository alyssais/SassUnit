# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sassunit/info'

Gem::Specification.new do |spec|
  spec.name          = SassUnit::NAME
  spec.version       = SassUnit::VERSION
  spec.authors       = ["Alyssa Ross"]
  spec.email         = ["hi@alyssa.is"]
  spec.summary       = SassUnit::DESCRIPTION
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "sass"
  spec.add_dependency "commander"
  spec.add_dependency "minitest"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
