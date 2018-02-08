class ChangeTimeToBeDatetimeInActivities < ActiveRecord::Migration[5.1]
  def change
  	change_column :activities, :time_from, 'timestamp USING CAST(time_from AS timestamp without time zone)'
  	change_column :activities, :time_to, 'timestamp USING CAST(time_to AS timestamp without time zone)'
  end
end

