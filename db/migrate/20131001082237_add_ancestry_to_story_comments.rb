class AddAncestryToStoryComments < ActiveRecord::Migration
  def up
    add_column :story_comments, :ancestry, :string
    add_index :story_comments, :ancestry
  end

  def down
    remove_column :story_comments, :ancestry
    remove_index :story_comments, :ancestry
  end
end
