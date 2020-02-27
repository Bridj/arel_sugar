# frozen_string_literal: true

require "spec_helper"

describe ArelSugar::Arel::Nodes::RegexpMatches do
  let(:attribute) { User.arel_attr(:username) }

  context "case sensitive" do
    subject { attribute =~ /bob|alice/ }

    db :postgresql do
      it { is_expected.to convert_to_sql %("users"."username" ~ 'bob|alice') }
    end

    db :mysql do
      it { is_expected.to convert_to_sql %(`users`.`username` REGEXP BINARY 'bob|alice') }
    end

    db :sqlite3 do
      it { is_expected.to convert_to_sql %("users"."username" REGEXP 'bob|alice') }
    end
  end

  context "case insensitive" do
    subject { attribute =~ /bob|alice/i }

    db :postgresql do
      it { is_expected.to convert_to_sql %("users"."username" ~* 'bob|alice') }
    end

    db :mysql do
      it { is_expected.to convert_to_sql %(`users`.`username` REGEXP 'bob|alice') }
    end

    db :sqlite3 do
      it { is_expected.to convert_to_sql %("users"."username" REGEXP 'bob|alice') }
    end
  end
end
