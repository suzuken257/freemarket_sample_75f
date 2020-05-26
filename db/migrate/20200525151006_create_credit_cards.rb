class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.integer :card_number, unique: true
      t.integer :expiration_year
      t.integer :expiration_month
      t.integer :security_code
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
