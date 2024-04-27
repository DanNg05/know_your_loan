class AddRatesToBanks < ActiveRecord::Migration[7.1]
  def change
    add_reference :banks, :rate, null: false, foreign_key: true
    change_column_null :banks, :rate_id, true
  end
end
