class CreateStoryComments < ActiveRecord::Migration
  def change
    create_table :story_comments do |t|
      t.text :text
      t.references :author

      t.timestamps
    end
    add_index :story_comments, :author_id
  end
end
