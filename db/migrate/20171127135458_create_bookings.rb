class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :event, foreign_key: true
      t.references :user, foreign_key: true
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
