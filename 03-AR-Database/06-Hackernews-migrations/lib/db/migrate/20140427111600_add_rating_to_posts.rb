class AddRatingToPosts < ActiveRecord::Migration
  def up
    add_column :posts, :rating, :integer
  end
end