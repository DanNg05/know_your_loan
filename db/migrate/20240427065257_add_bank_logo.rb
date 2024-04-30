class AddBankLogo < ActiveRecord::Migration[7.1]
  def change
    add_column :banks, :image_url, :string
  end
end
