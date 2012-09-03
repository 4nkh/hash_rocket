# -*- encoding: utf-8 -*-
require File.expand_path('../lib/hash_rocket/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["sparkplug"]
  gem.email         = ["mathieub@4nkh.com"]
  gem.description   = %q{find and replace old hash rocket}
  gem.summary       = %q{hash rocket explode}
  gem.homepage      = "https://github.com/4nkh/hash_rocket"

  gem.add_development_dependency "rspec"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "hash_rocket"
  gem.require_paths = ["lib"]
  gem.version       = HashRocket::VERSION
end
