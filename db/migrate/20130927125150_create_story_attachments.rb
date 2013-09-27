class CreateStoryAttachments < ActiveRecord::Migration
  def change
    create_table :story_attachments do |t|
      t.string :path
      t.references :story

      t.timestamps
    end
    add_index :story_attachments, :story_id
  end
end
