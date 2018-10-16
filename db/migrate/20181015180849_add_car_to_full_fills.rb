class AddCarToFullFills < ActiveRecord::Migration[5.2]
  def change
    add_reference :full_fills, :car, foreign_key: true
  end
end
