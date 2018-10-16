class AddCompleteToFullFills < ActiveRecord::Migration[5.2]
  def change
    add_column :full_fills, :complete, :boolean
  end
end
