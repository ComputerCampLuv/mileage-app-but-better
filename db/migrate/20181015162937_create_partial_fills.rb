class CreatePartialFills < ActiveRecord::Migration[5.2]
  def change
    create_table :partial_fills do |t|
      t.belongs_to :full_fill, foreign_key: true
      t.decimal :price_per_litre, precision: 4, scale: 1
      t.decimal :total_price, precision: 5, scale: 2
      t.decimal :miles_complete, precision: 5, scale: 1

      t.timestamps
    end
  end
end
