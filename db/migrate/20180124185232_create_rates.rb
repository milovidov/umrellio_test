class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates, id: false do |t|
      t.bigint :post_id
      t.primary_key :post_id

      t.bigint :count
      t.float  :rate

      t.timestamps
    end
    add_index :rates, [:rate], order: { rate: :desc }
  end
end
