class CreateAuthorships < ActiveRecord::Migration
  def change
    create_table :authorships do |t|
      t.references :author
      t.references :book

      t.timestamps null: false
    end
  end
end
