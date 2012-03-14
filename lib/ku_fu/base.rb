module KuFu

  def self.included base
    base.class_eval do
      extend ClassMethods
      include InstanceMethods
    end
  end

  module ClassMethods
    def register_ku_fu
      before_save :ku_fu_register
      before_destroy :ku_fu_register_deleter
    end
  end

  module InstanceMethods

    def ku_fu_register
      if new_record?
        write_attribute(:creator_id, User.current.id) if self.respond_to?(:creator_id)
      else
        write_attribute(:updater_id, User.current.id) if self.respond_to?(:updater_id)
      end
    end

    def ku_fu_register_deleter
        write_attribute(:deleter_id, User.current.id) if self.respond_to?(:deleter_id)
    end

  end

end

ActiveRecord::Base.send(:include, KuFu)
