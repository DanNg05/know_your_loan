class RenamePersonalsToHomebuyer < ActiveRecord::Migration[7.1]
  def change
    rename_table :personals, :homebuyers
  end
end
