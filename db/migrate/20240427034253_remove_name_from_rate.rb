class RemoveNameFromRate < ActiveRecord::Migration[7.1]
  def change
    remove_column :rates, :name, :string
  end
end
