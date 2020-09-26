class AddAdminsNameToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :admins_name, :string, null: false
  end
end
