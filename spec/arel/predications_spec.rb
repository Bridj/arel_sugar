# frozen_string_literal: true

require "spec_helper"

describe ArelSugar::Arel::Predications do
  let(:attribute) { User.arel_attr attr_name }
  let(:attr_name) { :score }

  METHODS = {
    # Arel method:  [ Ruby op, SQL op     ]
    eq:             [ "==", "= %s"        ],
    in:             [ nil,  "IN (%s)"     ],
    matches:        [ "=~", "LIKE %s"     ],
    does_not_match: [ "!~", "NOT LIKE %s" ],
    gteq:             ">=",
    gt:               ">",
    lt:               "<",
    lteq:             "<=",
    not_eq:           "!="
  }.freeze

  METHODS.each do |method, (operator, sql_operator)|
    sql_operator ||= "#{operator} %s"

    describe "the method `#{method}`" do
      subject { attribute.send(method, 42) }

      it_behaves_like "a predicate method"

      it { is_expected.to convert_to_sql %("users"."score" #{sql_operator % 42}) }

      if operator
        it "is aliased as `#{operator}`" do
          expect(described_class.instance_method(operator)).to eq(
            described_class.instance_method(method)
          )
        end
      end
    end
  end

  context "LIKE operator" do
    let(:attr_name) { :username }

    describe "the method `matches`" do
      subject { attribute.matches("bob") }

      it_behaves_like "a predicate method"

      it { is_expected.to convert_to_sql %("users"."username" LIKE 'bob') }
    end

    describe "the method `does_not_match`" do
      subject { attribute.does_not_match("bob") }

      it_behaves_like "a predicate method"

      it { is_expected.to convert_to_sql %("users"."username" NOT LIKE 'bob') }
    end
  end

  context "Regular Expressions" do
    let(:attr_name) { :username }

    describe "the method `matches_regexp`" do
      subject { attribute.matches_regexp(/foo/) }

      it_behaves_like "a predicate method"

      it { is_expected.to be_a ArelSugar::Arel::Nodes::RegexpMatches }
    end

    describe "the method `does_not_match_regexp`" do
      subject { attribute.does_not_match_regexp(/foo/) }

      it_behaves_like "a predicate method"

      it { is_expected.to be_a Arel::Nodes::Not }

      it "should be the negation of an ArelSugar::Arel::Nodes::RegexpMatches" do
        expect(subject.expr).to be_a ArelSugar::Arel::Nodes::RegexpMatches
      end
    end

    describe "the operator `=~` called with a Regexp" do
      it "should delegate to the method `matches_regexp`" do
        expect(attribute).to receive(:matches_regexp).once.with(/foo/).and_return(:ok)
        expect(attribute =~ /foo/).to eq :ok
      end
    end

    describe "the operator `!~` called with a Regexp" do
      it "should delegate to the method `matches_regexp`" do
        expect(attribute).to receive(:does_not_match_regexp).once.with(/foo/).and_return(:ok)
        expect(attribute !~ /foo/).to eq :ok
      end
    end
  end
end
