class AddFNameAndLNameAndPhotoAndDescriptionAndEmailAndTelAndStatus < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :description, :text
    add_column :users, :status, :boolean, default: false
    add_column :users, :tarif, :integer
    add_column :users, :location, :string
  end
end
