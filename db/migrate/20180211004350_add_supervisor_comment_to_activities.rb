class AddSupervisorCommentToActivities < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :supervisor_comment, :text
  end
end
