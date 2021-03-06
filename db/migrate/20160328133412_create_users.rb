class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :photo_id
      t.string :description
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
