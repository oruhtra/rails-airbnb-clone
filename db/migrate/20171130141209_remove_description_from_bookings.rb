class RemoveDescriptionFromBookings < ActiveRecord::Migration[5.1]
  def change
    remove_column :bookings, :description, :string
  end
end
