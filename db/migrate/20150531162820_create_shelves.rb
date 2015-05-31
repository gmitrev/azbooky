class CreateShelves < ActiveRecord::Migration
  def change
    create_table :shelves do |t|
      t.string :name
      t.references :user, index: true
      t.boolean :system

      t.timestamps null: false
    end
    add_foreign_key :shelves, :users
  end
end
