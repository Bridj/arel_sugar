# frozen_string_literal: true

module DatabaseSystemHelper
  def db(name)
    yield if name.to_s == SexyScopesSpec.database_system
  end
end
