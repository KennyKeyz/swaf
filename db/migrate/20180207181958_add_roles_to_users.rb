class AddRolesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :su_role, :boolean
    add_column :users, :ss_role, :boolean
    add_column :users, :dp_role, :boolean
    add_column :users, :s_role, :boolean, default: true
  end
end
