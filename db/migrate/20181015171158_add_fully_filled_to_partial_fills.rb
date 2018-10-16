class AddFullyFilledToPartialFills < ActiveRecord::Migration[5.2]
  def change
    add_column :partial_fills, :fully_filled, :boolean
  end
end
