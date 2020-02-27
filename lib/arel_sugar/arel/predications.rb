# frozen_string_literal: true

module ArelSugar
  module Arel
    module Predications
      def eq(other)
        ArelSugar.extend_predicate(super)
      end
      alias == eq

      def in(other)
        ArelSugar.extend_predicate(super)
      end

      def matches(other, *)
        if other.is_a? Regexp
          matches_regexp(other)
        else
          ArelSugar.extend_predicate(super)
        end
      end
      alias =~ matches

      def does_not_match(other, *)
        if other.is_a? Regexp
          does_not_match_regexp(other)
        else
          ArelSugar.extend_predicate(super)
        end
      end
      alias !~ does_not_match

      def matches_regexp(other)
        predicate = Arel::Nodes::RegexpMatches.new(self, other)
        ArelSugar.extend_predicate(predicate)
      end

      def does_not_match_regexp(other)
        matches_regexp(other).not
      end

      def gteq(other)
        ArelSugar.extend_predicate(super)
      end
      alias >= gteq

      def gt(other)
        ArelSugar.extend_predicate(super)
      end
      alias > gt

      def lt(other)
        ArelSugar.extend_predicate(super)
      end
      alias < lt

      def lteq(other)
        ArelSugar.extend_predicate(super)
      end
      alias <= lteq

      def not_eq(other)
        ArelSugar.extend_predicate(super)
      end
      alias != not_eq
    end
  end
end
