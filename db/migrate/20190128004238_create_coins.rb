class CreateCoins < ActiveRecord::Migration[5.2]
  def change
    create_table :coins do |t|
      t.string :cmc_id
      t.string :name
      t.string :symbol
      t.string :price_usd
      t.string :price_btc

      t.timestamps
    end
  end
end
