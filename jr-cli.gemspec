# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jr/cli/version'

Gem::Specification.new do |spec|
  spec.name          = "jr-cli"
  spec.version       = Jr::Cli::VERSION
  spec.authors       = ["Yuya Takeyama"]
  spec.email         = ["sign.of.the.wolf.pentagram@gmail.com"]
  spec.summary       = %q{jr: command-line JSON processor for Rubyists}
  spec.description   = %q{jr is jq like JSON processor. Its script can be written in Ruby}
  spec.homepage      = "https://github.com/yuya-takeyama/jr"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "yajl-ruby", "~> 1.2"
  spec.add_runtime_dependency "coderay", "~> 1.1.0"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.4.2"
  spec.add_development_dependency "test-unit", "~> 3.1.3"
  spec.add_development_dependency "aruba", "0.9.0"
  spec.add_development_dependency "guard", "~> 2.13.0"
  spec.add_development_dependency "guard-test", "~> 2.0.6"
  spec.add_development_dependency "guard-cucumber", "~> 1.6.0"
  spec.add_development_dependency "woothee", "~> 1.2.0"
end
