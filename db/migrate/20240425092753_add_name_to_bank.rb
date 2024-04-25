class AddNameToBank < ActiveRecord::Migration[7.1]
  def change
    add_column :banks, :name, :string
  end
end
