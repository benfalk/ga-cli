# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ga/cli/version'

Gem::Specification.new do |spec|
  spec.name          = 'ga-cli'
  spec.version       = GA::Cli::VERSION
  spec.authors       = ['Benjamin Falk']
  spec.email         = ['bn_falk@yahoo.com']
  spec.description   = 'Google Analytics CLI'
  spec.summary       = 'Tool to interact with your Google Analytics from the command line'
  spec.homepage      = 'https://github.com/benfalk/ga-cli'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib']

  # DSL for commandline application functionality
  spec.add_dependency 'gli'

  # OAuth for the Goog
  spec.add_dependency 'oauth2'

  # HTTP data transfer
  spec.add_dependency 'httparty'

  # Lib for fetching google analytics
  spec.add_dependency 'legato'

  # Cucumber w/ built in step definitions (Acceptance Testing)
  spec.add_development_dependency 'aruba'

  # Unit Testing
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
