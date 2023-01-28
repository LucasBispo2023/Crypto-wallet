class AddPriceToCoins < ActiveRecord::Migration[7.0]
  def change
    add_column :coins, :price, :float, null: true
  end
end
