class AddStateToStory < ActiveRecord::Migration
  def change
    add_column :stories, :state, :string
    remove_column :stories, :status
  end
end
