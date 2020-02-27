# frozen_string_literal: true

require "spec_helper"

describe ArelSugar::Arel::Math do
  let(:attribute) { User.arel_attr :score }

  describe "the method `*`" do
    subject { attribute * 42 }

    it_behaves_like "an expression method"

    it { is_expected.to convert_to_sql %("users"."score" * 42) }
  end

  describe "the method `+`" do
    subject { attribute + 42 }

    it_behaves_like "an expression method"

    it { is_expected.to convert_to_sql %{("users"."score" + 42)} }
  end

  describe "the method `-`" do
    subject { attribute - 42 }

    it_behaves_like "an expression method"

    it { is_expected.to convert_to_sql %{("users"."score" - 42)} }
  end

  describe "the method `/`" do
    subject { attribute / 42 }

    it_behaves_like "an expression method"

    it { is_expected.to convert_to_sql %("users"."score" / 42) }
  end

  describe "Ruby type coercion" do
    subject { 42 / attribute }

    it_behaves_like "an expression method"

    it { is_expected.to convert_to_sql %(42 / "users"."score") }
  end

  if ::Arel::VERSION >= "6.0.0"
    describe "SQL typecasting" do
      [42.0, "42.0", BigDecimal("42.0")].each do |value|
        context value.class.name do
          subject { attribute * value }

          it_behaves_like "an expression method"

          it "should cast #{value.inspect} to column type (integer)" do
            expect(subject).to convert_to_sql %("users"."score" * 42)
          end
        end
      end
    end
  end
end
