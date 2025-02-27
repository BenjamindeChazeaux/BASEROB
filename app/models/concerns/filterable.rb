module Filterable
  extend ActiveSupport::Concern
  
  module ClassMethods
    def filter_by(attribute)
      scope "filter_by_#{attribute}", ->(value) { where(attribute => value) }
    end
  end
end 