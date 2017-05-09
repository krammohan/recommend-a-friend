class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :email, :null => false, :unique => true
      t.string :hashed_password, :null => false
      t.string :location, :null => false
      t.string :phone, :null => false
      t.string :looking_for_contacts, :null => false

      t.timestamps
    end
  end
end
