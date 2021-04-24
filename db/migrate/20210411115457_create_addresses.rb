class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer    :prefecture_id,  null: false
      t.string     :post_code,      null: false
      t.string     :area_city,      null: false
      t.string     :area2_address,  null: false
      t.string     :area3_building
      t.string     :phone_number,   null: false
      t.references :buyer,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
