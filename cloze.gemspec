# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cloze/version'

Gem::Specification.new do |gem|
  gem.name          = "cloze"
  gem.version       = Cloze::VERSION
  gem.authors       = ["Brad Chase"]
  gem.email         = ["bchase@doubleclickdetroit.com"]
  gem.description   = "A Ruby cloze deletion module"
  gem.summary       = "A Ruby cloze deletion module"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'pry'

  gem.add_dependency 'activesupport'
end
