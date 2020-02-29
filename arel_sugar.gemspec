# frozen_string_literal: true

require File.expand_path("lib/arel_sugar/version", __dir__)

Gem::Specification.new do |gem|
  gem.name          = "arel_sugar"
  gem.version       = ArelSugar::VERSION

  gem.summary = %(Write beautiful and expressive ActiveRecord scopes without SQL.)
  gem.description = %{Small DSL to create ActiveRecord (>= 5.0) attribute predicates without writing SQL.}

  gem.authors       = ["Samuel Lebeau", "Paul Bernays"]
  gem.email         = ["samuel.lebeau@gmail.com", "pbernays@bridj.com"]
  gem.homepage      = "https://github.com/bridj/arel_sugar"

  gem.files         = Dir["*.md", "LICENSE", "lib/**/*.rb"]

  gem.licenses = ["MIT"]

  gem.required_ruby_version = ">= 2.3.0"

  gem.add_dependency "activerecord", ">= 5.0"

  gem.add_development_dependency "appraisal", "~> 2.1"
  gem.add_development_dependency "bundler", "~> 2.0"
  gem.add_development_dependency "pry"
  gem.add_development_dependency "rake", ">= 0.9"
  gem.add_development_dependency "rspec", "~> 3.0"
  gem.add_development_dependency "rubocop", "~> 0.80"

  if RUBY_ENGINE == "jruby"
    gem.add_development_dependency "activerecord-jdbcpostgresql-adapter", "~> 1.0"
    gem.add_development_dependency "activerecord-jdbcsqlite3-adapter"
    gem.add_development_dependency "jdbc-sqlite3", "~> 3.0"
    gem.add_development_dependency "kramdown", "~> 1.2"
  else
    gem.add_development_dependency "pg", "~> 0.8"
    gem.add_development_dependency "redcarpet", "~> 3.0"
    gem.add_development_dependency "sqlite3", "~> 1.4"
  end

  gem.add_development_dependency "simplecov"
  gem.add_development_dependency "yard", "~> 0.8"
end
