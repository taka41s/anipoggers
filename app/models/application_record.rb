class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  resourcify

  class User < ActiveRecord::Base
    after_create :assign_default_role
  
    def assign_default_role
      self.add_role(:newuser) if self.roles.blank?
    end
  end
end
