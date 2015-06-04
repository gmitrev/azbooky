class AddFavouriteToRelationships < ActiveRecord::Migration
  def change
    add_column :relationships, :favourite, :boolean
  end
end
