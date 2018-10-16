class PartialFill < ApplicationRecord
  belongs_to :full_fill

  def litres
    self.total_price * 100 / self.price_per_litre
  end
end
