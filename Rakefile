#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rspec/core'
require 'rspec/core/rake_task'
require "nlp_toolz"

RSpec::Core::RakeTask.new(:spec) do |spec|
  NlpToolz.check_dependencies
  spec.pattern = FileList['spec/**/*_spec.rb']
end

task :default => :spec

require 'yard'
YARD::Rake::YardocTask.new

Dir["lib/tasks/**/*.rake"].sort.each { |ext| load ext }
