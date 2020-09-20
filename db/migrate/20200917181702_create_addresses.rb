class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer   :purchase_id        , null: false, foreign_key: true
      t.string    :postal_code        , null: false
      t.integer   :shipping_origin_id , null: false
      t.string    :city               , null: false
      t.string    :block_num          , null: false
      t.string    :apartment_name
      t.string    :phone_num          , null: false

      t.timestamps
    end
  end
end
