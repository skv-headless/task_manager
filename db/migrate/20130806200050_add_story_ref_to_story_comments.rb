class AddStoryRefToStoryComments < ActiveRecord::Migration
  def change
    add_column :story_comments, :story_id, :integer
    add_index :story_comments, :story_id
  end
end
