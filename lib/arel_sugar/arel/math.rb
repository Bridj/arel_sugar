# frozen_string_literal: true

module ArelSugar
  module Arel
    module Math
      include Typecasting

      def *(other)
        ArelSugar.extend_expression(super)
      end

      def +(other)
        ArelSugar.extend_expression(super)
      end

      def -(other)
        ArelSugar.extend_expression(super)
      end

      def /(other)
        ArelSugar.extend_expression(super)
      end

      def coerce(other)
        expression = ::Arel.sql(other.to_s)
        [ArelSugar.extend_expression(expression), self]
      end
    end
  end
end
