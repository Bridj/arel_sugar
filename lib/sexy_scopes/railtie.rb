# frozen_string_literal: true

module SexyScopes
  class Railtie < Rails::Railtie
    initializer "sexy_scopes" do
      ActiveSupport.on_load :active_record do
        require "sexy_scopes/active_record"
      end
    end
  end
end
