class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts, id: :bigserial do |t|
      t.text :title
      t.text :body
      t.inet :ip

      t.timestamps
    end

    add_reference :posts, :user, type: :bigint, foreign_key: true
    add_index :posts, [:ip, :user_id]
  end
end
