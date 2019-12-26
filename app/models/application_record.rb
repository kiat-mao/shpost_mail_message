class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  before_create do
    if self.respond_to? :created_day
      self.created_day = self.created_at.strftime("%d")
    end
  end
end
