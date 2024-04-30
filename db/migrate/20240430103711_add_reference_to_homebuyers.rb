class AddReferenceToHomebuyers < ActiveRecord::Migration[7.1]
  def change
    add_reference :homebuyers, :rate, foreign_key: true
  end
end
