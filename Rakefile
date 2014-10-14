require 'bundler/gem_tasks'
require 'cucumber/rake/task'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RuboCop::RakeTask.new

RSpec::Core::RakeTask.new(:spec) do |t|
  t.fail_on_error = false
  t.rspec_opts = %w(--format documentation --color)
end

Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = %w(--format pretty)
end

task default: %w(spec cucumber rubocop)
