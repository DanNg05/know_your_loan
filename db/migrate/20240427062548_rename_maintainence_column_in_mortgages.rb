class RenameMaintainenceColumnInMortgages < ActiveRecord::Migration[7.1]
  def change
    rename_column :mortgages, :maintainence_fund, :maintenance_fund
  end
end
