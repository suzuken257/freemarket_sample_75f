class CreateDeliverAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :deliver_adresses do |t|
      t.string :zip_code, null: false
      t.string :prefecture, null: false
      t.string :city, null: false
      t.string :adress1, null: false
      t.string :apartment_adress
      t.integer :telephone, unique: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
