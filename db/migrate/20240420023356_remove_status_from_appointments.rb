class RemoveStatusFromAppointments < ActiveRecord::Migration[7.1]
  def change
    remove_column :appointments, :status, :string
  end
end
