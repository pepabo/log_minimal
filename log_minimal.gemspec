# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'log_minimal/version'

Gem::Specification.new do |spec|
  spec.name          = "log_minimal"
  spec.version       = LogMinimal::VERSION
  spec.authors       = ["SHIBATA Hiroshi"]
  spec.email         = ["shibata.hiroshi@gmail.com"]
  spec.summary       = %q{Ruby port of Log::Minimal.}
  spec.description   = %q{Ruby port of Log::Minimal.}
  spec.homepage      = "https://github.com/paperboy-all/log_minimal"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
