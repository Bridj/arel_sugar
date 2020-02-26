# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "appraisal"

desc "Run specifications (using sqlite3)"
RSpec::Core::RakeTask.new(:spec)

desc "Measure test coverage"
task :cov do
  ENV["COVERAGE"] = "1"
  Rake::Task[:spec].invoke
end

namespace :spec do
  databases = %w[postgresql sqlite3]

  databases.each do |db|
    desc "Run specifications using #{db} database"
    task db do
      ENV["DB"] = db
      Rake::Task[:spec].reenable
      Rake::Task[:spec].invoke
    end
  end

  desc "Run specifications using all databases"
  task all: databases
end

task default: :spec
