class AddTimeZoneToActivities < ActiveRecord::Migration[5.1]
  def change
  	add_column :activities, :time_zone, :text
  end
end
