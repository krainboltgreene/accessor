# -*- encoding: utf-8 -*-
require File.expand_path('../lib/accessor/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Kurtis Rainbolt-Greene"]
  gem.email         = ["kurtisrainboltgreene@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "accessor"
  gem.require_paths = ["lib"]
  gem.version       = Accessor::VERSION

  gem.add_development_dependency 'rake', '~> 0.9'
  gem.add_development_dependency 'rocco', '~> 0.8'
  gem.add_development_dependency 'awesome_print', '~> 1.0'
  gem.add_development_dependency 'guard', '~> 0.10'
  gem.add_development_dependency 'guard-minitest', '~> 0.4'
  gem.add_development_dependency 'guard-rocco', '~> 0.0.3'
  gem.add_development_dependency 'guard-bundler', '~> 0.1'
end
