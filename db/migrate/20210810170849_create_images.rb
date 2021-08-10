class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.column(:url, :string)
      t.column(:description, :string)
      t.column(:user_id, :integer)

      t.timestamps()
    end
  end
end
