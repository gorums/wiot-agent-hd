# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wiot-agent-hd/version'

Gem::Specification.new do |spec|
  spec.name          = 'wiot-agent-hd'
  spec.version       = WiotAgentHd::VERSION
  spec.authors       = ['gorums']
  spec.email         = ['acksecurity@hotmail.com']

  spec.summary       = %q{WatchIoT Agent to monitor hard drivers.}
  spec.description   = %q{This gem is a WatchIoT Agent use to monitor the hard drivers.}
  spec.homepage      = 'http://www.watchiot.com'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
