class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :phone_number
      t.integer :gender
      t.string :avatar
      t.boolean :is_admin, default: false

      t.timestamps
    end
  end
end
