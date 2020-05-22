class CreateDeliverAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :deliver_addresses do |t|
      t.string :family_name
      t.string :first_name
      t.string :family_name_kana
      t.string :first_name_kana
      t.string :zip_code, null: false
      t.string :prefecture
      t.string :city, null: false
      t.string :address1, null: false
      t.string :apartment_address
      t.integer :telephone, unique: true, limit: 8
      t.integer :user_id, null: false, unique: true
      t.timestamps
    end
  end
end
