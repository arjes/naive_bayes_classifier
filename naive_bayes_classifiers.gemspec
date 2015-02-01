# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'naive_bayes_classifiers/version'

Gem::Specification.new do |spec|
  spec.name          = "naive_bayes_classifiers"
  spec.version       = NaiveBayesClassifiers::VERSION
  spec.authors       = ["Brian Malinconico"]
  spec.email         = ["arjesins@gmail.com"]
  spec.summary       = %q{Implmentes subset of Naive Bayes Classifiers}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1"
  spec.add_development_dependency "simplecov", "~> 0.9.0"
  spec.add_development_dependency "guard", "~> 2.11.0"
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'libnotify'
  spec.add_development_dependency 'pry'
end
