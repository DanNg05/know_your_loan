class AddDetailsToReviews < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :content, :text
    add_column :reviews, :rating, :integer
  end
end
