class AddForeignKeyForImages < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :images, :users
  end
end
