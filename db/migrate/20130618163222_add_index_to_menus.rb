class AddIndexToMenus < ActiveRecord::Migration
  def change
    add_index(:menus, [:video_id], :unique => true)
    add_index(:menus, [:created_at, :state])
  end
end
