# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ga/cli/version'

Gem::Specification.new do |spec|
  spec.name          = "ga-cli"
  spec.version       = Ga::Cli::VERSION
  spec.authors       = ["Benjamin Falk"]
  spec.email         = ["bn_falk@yahoo.com"]
  spec.description   = %q{Google Analytics CLI}
  spec.summary       = %q{Tool to interact with your Google Analytics from the command line}
  spec.homepage      = "https://github.com/benfalk/ga-cli"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
