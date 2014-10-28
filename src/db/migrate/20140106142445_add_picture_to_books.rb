class AddPictureToBooks < ActiveRecord::Migration
  def change
    add_column :books, :picture_data, :binary
    add_column :books, :content_type, :string
  end
end
