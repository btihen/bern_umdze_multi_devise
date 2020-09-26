class AddUsernameToPatrons < ActiveRecord::Migration[6.0]
  def change
    # rename_column :patrons, :email, :username

    # add_column :patrons, :username, :string, null: false
    # add_index  :patrons, :username, unique: true
  end
end
