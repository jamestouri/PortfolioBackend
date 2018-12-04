class CreateInvestments < ActiveRecord::Migration[5.2]
  def change
    create_table :investments do |t|
      t.string :company, null: false
      t.integer :quantity, null: false
      t.integer :cost, null: false
      t.date :date_of_trade, null: false
      t.date :date_created, null: false 
    end
  end
end
