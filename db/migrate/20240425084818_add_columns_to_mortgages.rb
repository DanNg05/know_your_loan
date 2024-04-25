class AddColumnsToMortgages < ActiveRecord::Migration[7.1]
  def change
    add_column :mortgages, :property_value, :decimal
    add_column :mortgages, :total_equity, :decimal
    add_column :mortgages, :interest_rate, :float
  end
end
