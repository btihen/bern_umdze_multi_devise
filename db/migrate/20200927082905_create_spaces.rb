class CreateSpaces < ActiveRecord::Migration[6.0]
  def change
    create_table :spaces do |t|
      t.string :space_name,            null: false
      t.string :space_location

      t.timestamps
    end
    add_index :spaces, :space_name, unique: true
  end
end
