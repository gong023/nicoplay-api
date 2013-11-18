class AddIndexToHistories < ActiveRecord::Migration
  def change
    add_index(:histories, [:video_id], :unique => true)
    add_index(:histories, [:created_at, :state])
  end
end
