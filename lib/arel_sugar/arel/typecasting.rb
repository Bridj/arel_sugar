# frozen_string_literal: true

module ArelSugar
  module Arel
    module Typecasting
      def *(other)
        super ArelSugar.type_cast(other, self)
      end

      def +(other)
        super ArelSugar.type_cast(other, self)
      end

      def -(other)
        super ArelSugar.type_cast(other, self)
      end

      def /(other)
        super ArelSugar.type_cast(other, self)
      end
    end
  end
end
