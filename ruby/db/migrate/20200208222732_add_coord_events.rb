class AddCoordEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :lon, :numeric
    add_column :events, :lat, :numeric
    add_column :events, :address, :string
  end
end
