class AddUsernameToPatrons < ActiveRecord::Migration[6.0]
  def change
    # add_column :patrons, :username, :string
    rename_column :patrons, :email, :username
  end
end
