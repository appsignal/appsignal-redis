# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'appsignal-redis/version'

Gem::Specification.new do |s|
  s.name          = 'appsignal-redis'
  s.version       = Appsignal::Redis::VERSION
  s.platform      = Gem::Platform::RUBY
  s.authors       = ['Steven Weller', 'Ron Cadier']
  s.email         = %w{contact@appsignal.com}

  s.homepage      = 'https://github.com/appsignal/appsignal-redis'
  s.license       = 'MIT'
  s.summary       = 'Add instrument calls to redis.'\
                    'For use with Appsignal.'
  s.description   = ''
  s.files         = Dir.glob('lib/**/*') + %w(README.md)

  s.require_path  = 'lib'

  s.add_dependency 'appsignal', '> 0.7'
  s.add_dependency 'redis', '> 2.2'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'pry'
end
