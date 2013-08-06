class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.integer :status
      t.text :description
      t.references :assigned_to

      t.timestamps
    end
    add_index :stories, :assigned_to_id
  end
end
