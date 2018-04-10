class AddSectorHeadCommentToActivities < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :sector_head_comment, :text
  end
end
