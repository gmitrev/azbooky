class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.references :user, index: true
      t.references :book, index: true
      t.references :shelf, index: true
      t.string :feeling

      t.timestamps null: false
    end
    add_foreign_key :relationships, :users
    add_foreign_key :relationships, :books
    add_foreign_key :relationships, :shelves
  end
end
