class AddRateToMortgages < ActiveRecord::Migration[7.1]
  def change
    add_reference :mortgages, :rate, null: false, foreign_key: true
  end
end
