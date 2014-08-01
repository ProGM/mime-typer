#!/usr/bin/env rake
require 'bundler/gem_tasks'
require 'rake/testtask'

task :default => [:test]

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['tests/test_*.rb']
end

desc 'Open a pry session preloaded with this library'
task :console do
  require 'pry'
  require './lib/mime-typer.rb'
  ARGV.clear
  Pry.start
end
