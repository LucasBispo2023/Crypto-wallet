class CreateCryptoPrices < ActiveRecord::Migration[7.0]
  def change
    create_table :crypto_prices do |t|

      t.timestamps
    end
  end
end
