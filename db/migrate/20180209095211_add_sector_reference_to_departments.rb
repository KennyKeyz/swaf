class AddSectorReferenceToDepartments < ActiveRecord::Migration[5.1]
  def change
    add_reference :departments, :sector, foreign_key: true
  end
end
