# frozen_string_literal: true

RSpec.shared_examples "a predicate method" do
  it "should return an Arel node" do
    expect(subject.class.name).to match(/^(ArelSugar::)?Arel::Nodes::/)
  end

  it { is_expected.to be_extended_by ArelSugar::Arel::PredicateMethods }
end

RSpec.shared_examples "an expression method" do
  it "should return an Arel node" do
    expect(subject.class.name).to match(/^(ArelSugar::)?Arel::Nodes::/)
  end

  it { is_expected.to be_extended_by ArelSugar::Arel::ExpressionMethods }
end
