class AddRbDashboardSetting < ActiveRecord::Migration
  def self.up
    create_table :rb_dashboard_settings, :force => true do |t|
      t.integer :project_id, :null => false
      t.text 'settings'
    end
  end

  def self.down
    drop_table :rb_dashboard_settings
  end
end
