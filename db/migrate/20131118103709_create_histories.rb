class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.string :video_id
      t.string :title
      t.integer :state

      t.timestamps
    end
  end
end
