class AddUmdzesNameToUmdzes < ActiveRecord::Migration[6.0]
  def change
    add_column :umdzes, :umdzes_name, :string, null: false
  end
end
