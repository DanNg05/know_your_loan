class RemoveRateFromBanks < ActiveRecord::Migration[7.1]
  def change
    remove_reference :banks, :rate, null: false, foreign_key: true
  end
end
