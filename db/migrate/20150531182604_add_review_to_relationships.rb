class AddReviewToRelationships < ActiveRecord::Migration
  def change
    add_column :relationships, :review, :text
  end
end
