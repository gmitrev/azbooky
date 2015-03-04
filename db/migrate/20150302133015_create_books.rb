class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :description
      t.string :isbn
      t.string :lang
      t.integer :page_count
      t.integer :published_in
      t.string :published_by

      t.timestamps null: false
    end
  end
end
