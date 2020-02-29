# frozen_string_literal: true

module ArelSugar
  class Railtie < Rails::Railtie
    initializer "arel_sugar" do
      ActiveSupport.on_load :active_record do
        require "arel_sugar/active_record"
      end
    end
  end
end
