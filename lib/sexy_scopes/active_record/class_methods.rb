# frozen_string_literal: true

module SexyScopes
  module ActiveRecord
    module ClassMethods
      # Creates and extends an Arel <tt>Attribute</tt> representing the table's column with
      # the given <tt>name</tt>.
      #
      # @param [String, Symbol] name The attribute name
      #
      # @note Please note that no exception is raised if no such column actually exists.
      #
      # @example
      #   where arel_attr(:score) > 1000
      #
      def arel_attr(name)
        SexyScopes.extend_expression(arel_table[name])
      end

      # Creates and extends an Arel <tt>SqlLiteral</tt> instance for the given <tt>expression</tt>,
      # first converted to a string using <tt>to_s</tt>.
      #
      # @param [String, #to_s] expression Any SQL expression.
      #
      # @example
      #   where sql('LENGTH(email)') > 200
      #
      def sql_literal(expression)
        ::Arel.sql(expression.to_s).tap do |literal|
          SexyScopes.extend_expression(literal)
          SexyScopes.extend_predicate(literal)
        end
      end
      alias sql sql_literal
    end
  end
end
