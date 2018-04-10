class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :time_from
      t.string :time_to
      t.text :detail
      t.text :remarks

      t.timestamps
    end
  end
end
