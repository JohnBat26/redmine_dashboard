class RbDashboardSetting < ActiveRecord::Base
  serialize :settings

  belongs_to :project, :class_name => 'Project', :foreign_key => 'project_id'

  attr_protected :project_id, :settings


  def initialize(attributes=nil, *args)
    super
    self.settings ||= {}
  end

  def set_others_hash
    self.settings ||= {}
  end

  def [](attr_name)
    if has_attribute? attr_name
      super
    else
      settings ? settings[attr_name] : nil
    end
  end

  def []=(attr_name, value)
    if has_attribute? attr_name
      super
    else
      h = (read_attribute(:settings) || {}).dup
      h.update(attr_name => value)
      write_attribute(:settings, h)
      value
    end
  end
end








