class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.integer :age
      t.integer :sex
      t.string :address
      t.string :photo
      t.date :birthday
      t.integer :manage
      t.string :email

      t.timestamps
    end
  end
end
