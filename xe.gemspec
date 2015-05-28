# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xe/version'

Gem::Specification.new do |spec|
  spec.name          = "xe"
  spec.version       = XE::VERSION
  spec.authors       = ["Jikku Jose"]
  spec.email         = ["jikkujose@gmail.com"]
  spec.summary       = %q{Wrapper around xe.com for currency conversions.}
  spec.description   = %q{Unofficial wrapper around www.xe.com internal API, for academic purposes.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "pry"

  spec.add_dependency "faraday"
  spec.add_dependency "json"
  spec.add_dependency "nokogiri"
end
