# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "riot-ruby"
  spec.version       = '1.0.0'
  spec.authors       = ["Noah Ramey"]
  spec.email         = ["noahramey1997@gmail.com"]
  spec.description   = "Ruby wrapper for the Riot Games API"
  spec.summary       = "Ruby wrapper for the Riot Games API"
  spec.homepage      = "https://github.com/noahramey/riot-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "yard"
  spec.add_development_dependency "vcr"

  spec.add_runtime_dependency "httparty"
  spec.add_runtime_dependency "activesupport"
end
