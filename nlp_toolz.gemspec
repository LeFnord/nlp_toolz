# coding: utf-8
# @author: LeFnord
# @email:  pscholz.le@gmail.com
# @date:   2012-10-23

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nlp_toolz/version'

Gem::Specification.new do |gem|
  gem.name          = "nlp_toolz"
  gem.version       = NlpToolz::VERSION
  gem.authors       = ["LeFnord"]
  gem.email         = ["pscholz.le@gmail.com"]
  gem.description   = %q{make NLP tolls available, from OpenNLP and BerkeleyParser}
  gem.summary       = %q{wrapper around the openNLP toolset}
  gem.homepage      = "https://github.com/LeFnord/nlp_toolz"
  gem.license       = "LICENSE.txt"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rspec"
  
  gem.add_development_dependency "guard"
  gem.add_development_dependency "rb-fsevent"
  gem.add_development_dependency "guard-rspec"
  gem.add_development_dependency "guard-bundler"
  gem.add_development_dependency "terminal-notifier-guard"

  gem.add_development_dependency "yard"
  gem.add_development_dependency "syntax"
  gem.add_development_dependency "awesome_print"

  gem.add_runtime_dependency "rjb"
  gem.add_runtime_dependency "multi_json"
  # gem.add_runtime_dependency "birch"
  gem.add_runtime_dependency "gli"
  gem.add_runtime_dependency "rake"
  gem.add_runtime_dependency "celluloid"
  
end
