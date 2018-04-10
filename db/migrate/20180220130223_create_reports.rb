class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.string :name
      t.string :date_from
      t.string :date_to

      t.timestamps
    end
  end
end
