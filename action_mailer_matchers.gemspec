# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'action_mailer_matchers/version'

Gem::Specification.new do |spec|
  spec.name          = "action_mailer_matchers"
  spec.version       = ActionMailerMatchers::VERSION
  spec.authors       = ["Alexandra Ackerman, Kevin Curtin"]
  spec.email         = ["aaackerman.dev@gmail.com"]
  spec.summary       = %q{ActionMailerMatchers provides rspec matchers to test Rails' common ActionMailer functionality.}
  spec.description   = %q{ActionMailerMatchers provides rspec matchers to test Rails' common ActionMailer functionality.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
