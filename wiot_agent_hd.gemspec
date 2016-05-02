# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wiot_agent_hd/version'

Gem::Specification.new do |spec|
  spec.name          = 'wiot_agent_hd'
  spec.version       = WiotAgentHd::VERSION
  spec.authors       = ['gorums']
  spec.email         = ['acksecurity@hotmail.com']

  spec.summary       = %q{Monitor hard drivers.}
  spec.description   = %q{This gem is use to monitor the hard drivers.}
  spec.homepage      = 'http://www.watchiot.org'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
