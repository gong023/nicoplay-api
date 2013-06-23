class AddNotNullToMenus < ActiveRecord::Migration
  def change
      change_column(:menus, :video_id, :string, :null => false)
      change_column(:menus, :title, :string, :null => false)
      change_column(:menus, :state, :integer, :null => false)
  end
end
