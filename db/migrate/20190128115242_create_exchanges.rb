class CreateExchanges < ActiveRecord::Migration[5.2]
  def change
    create_table :exchanges do |t|
      t.string :from_coin
      t.string :to_coin
      t.float :amount
      t.float :result

      t.timestamps
    end
  end
end
