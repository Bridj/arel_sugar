# frozen_string_literal: true

require "arel_sugar/active_record/class_methods"
require "arel_sugar/active_record/dynamic_methods"
require "arel_sugar/active_record/query_methods"

ActiveRecord::Base.extend ArelSugar::ActiveRecord::ClassMethods
ActiveRecord::Base.extend ArelSugar::ActiveRecord::DynamicMethods

ActiveRecord::Relation.include ArelSugar::ActiveRecord::QueryMethods

ActiveRecord::QueryMethods::WhereChain.prepend(
  ArelSugar::ActiveRecord::QueryMethods::WhereChainMethods
)
