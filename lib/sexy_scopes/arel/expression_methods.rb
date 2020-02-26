# frozen_string_literal: true

module SexyScopes
  module Arel
    module ExpressionMethods
      include ::Arel::Math
      include Predications
      include Math
    end
  end
end
