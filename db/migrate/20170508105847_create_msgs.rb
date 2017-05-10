class CreateMsgs < ActiveRecord::Migration[5.1]
  def change
    create_table :msgs do |t|
      t.integer :user_id
      t.string :msg
      t.text :msg_return

      t.timestamps
    end
  end
end
