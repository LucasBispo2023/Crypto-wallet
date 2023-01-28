class CreateCoins < ActiveRecord::Migration[7.0]
  def change
    create_table :coins do |t|
      t.string :title
      t.string :acronyn
      t.float :quantity
      t.float :balance
      t.string :url_image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
