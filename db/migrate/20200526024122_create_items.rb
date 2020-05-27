class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,                            null:false
      t.integer :price,                          null:false
      t.text :introduction,                      null:false
      t.string :brand
      t.integer :size
      t.string :item_status
      t.string :shipping_fee_burden
      t.string :shipping_area_from, null: false
      t.string :estimated_shipping_date
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end