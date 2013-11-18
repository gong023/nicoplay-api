class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.string :video_id, :null => false
      t.string :title, :null => false
      t.integer :state, :null => false

      t.timestamps
    end
  end
end
