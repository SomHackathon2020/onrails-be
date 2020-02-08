class AddPictureEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :picture, :string
  end
end
