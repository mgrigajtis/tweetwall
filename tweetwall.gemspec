# -*- encoding: utf-8 -*-
require File.expand_path('../lib/tweetwall/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Matthew Grigajtis"]
  gem.email         = ["matthew@grigajtis.org"]
  gem.description   = %q{This Gem makes it very easy to add a wall of Tweets from a Twitter User in your web application.}
  gem.summary       = %q{Easily add a Tweet Wall.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "tweetwall"
  gem.require_paths = ["lib"]
  gem.version       = Tweetwall::VERSION
end
