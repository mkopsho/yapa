class AddRoleToMemberships < ActiveRecord::Migration[6.0]
  def change
    add_column :memberships, :role, :string
    remove_column :memberships, :category, :string
  end
end
