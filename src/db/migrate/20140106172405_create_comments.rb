class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :book

      t.timestamps
    end
    add_index :comments, :book_id
  end
end
