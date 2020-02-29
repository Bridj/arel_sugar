# frozen_string_literal: true

require "arel/visitors_extensions"

module ArelSugar
  module Arel
    autoload :ExpressionMethods, "arel_sugar/arel/expression_methods"
    autoload :PredicateMethods, "arel_sugar/arel/predicate_methods"

    autoload :Predications, "arel_sugar/arel/predications"
    autoload :Typecasting, "arel_sugar/arel/typecasting"
    autoload :Math, "arel_sugar/arel/math"

    module Nodes
      autoload :RegexpMatches, "arel_sugar/arel/nodes/regexp_matches"
    end
  end
end
