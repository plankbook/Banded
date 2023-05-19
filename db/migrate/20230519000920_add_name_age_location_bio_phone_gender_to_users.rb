class AddNameAgeLocationBioPhoneGenderToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :age, :integer
    add_column :users, :location, :string
    add_column :users, :bio, :string
    add_column :users, :phone, :string
    add_column :users, :gender, :string
  end
end
