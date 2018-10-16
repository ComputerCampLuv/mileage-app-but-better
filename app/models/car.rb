class Car < ApplicationRecord
  has_many :full_fills, dependent: :destroy
  has_many :partial_fills, through: :full_fills

  def to_s

    gallons = 0
    miles = 0
    price = 0

    self.full_fills.each do |ff| 
      if ff.complete
        gallons += ff.totals[:gallons]
        miles += ff.totals[:miles]
        price += ff.totals[:price]
      end
    end

    "MPG : #{sprintf('%.1f', miles / gallons)}  |  PPM : #{sprintf('%.1f', price * 100 / miles)}"
  end
end
