class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :broker, null: false, foreign_key: true

      t.timestamps
    end
  end
end
