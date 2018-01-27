class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, id: :bigserial do |t|
      t.text :login

      t.timestamps
    end
    add_index :users, [:login], :unique => true
  end
end
