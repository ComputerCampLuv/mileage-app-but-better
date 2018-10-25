class Car < ApplicationRecord
  has_many :full_fills, dependent: :destroy
  has_many :partial_fills, through: :full_fills

  def to_s

    gallons = 0
    miles = 0
    price = 0
    any_completed_fills = false

    self.full_fills.each do |ff| 
      if ff.complete
        any_completed_fills = true
        gallons += ff.totals[:gallons]
        miles += ff.totals[:miles]
        price += ff.totals[:price]
      end
    end

    if any_completed_fills
      "MPG : #{sprintf('%.1f', miles / gallons)}  |  PPM : #{sprintf('%.1f', price * 100 / miles)}"
    else
      "No fill-ups yet completed for this vehicle"
    end
  end
end
