# frozen_string_literal: true

require "active_support/lazy_load_hooks"
require "arel_sugar/version"

module ArelSugar
  autoload :Arel, "arel_sugar/arel"

  class << self
    def extend_expression(expression)
      expression.extend(Arel::ExpressionMethods)
    end

    def extend_predicate(predicate)
      predicate.extend(Arel::PredicateMethods)
    end

    def arel_9?
      @arel_9 ||= Gem::Version.new(::Arel::VERSION) >= Gem::Version.new("9.0.0")
    end

    def quote(node, attribute = nil)
      ::Arel::Nodes.build_quoted(node, attribute)
    end

    alias type_cast quote
  end
end

if defined? Rails::Railtie
  require "arel_sugar/railtie"
else
  ActiveSupport.on_load :active_record do
    require "arel_sugar/active_record"
  end
end
