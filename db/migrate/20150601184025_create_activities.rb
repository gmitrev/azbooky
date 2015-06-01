class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.references :user, index: true
      t.integer :object_id
      t.string :object_type
      t.string :activity_type

      t.timestamps null: false
    end
    add_foreign_key :activities, :users
  end
end
