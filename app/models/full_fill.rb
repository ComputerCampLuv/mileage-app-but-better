class FullFill < ApplicationRecord
  has_many :partial_fills, dependent: :destroy
  belongs_to :car

  def to_s
    set_variables
    "#{sprintf('%.1f', @litres)} litres  |  #{sprintf('%.1f', gallons)} gallons  |  Total: £#{@price}  |  #{@miles} Miles  |  #{sprintf('%.1f', mpg)} miles per gallon | #{sprintf('%.1f', ppm)} pence per mile"
  end

  def totals
    set_variables
    {
      gallons: gallons,
      price: @price,
      miles: @miles
    }
  end

  def set_variables
    @litres = 0
    @price = 0
    @miles = 0

    self.partial_fills.each do |pf| 
      @litres += pf.litres
      @price += pf.total_price
      @miles += pf.miles_complete
    end
  end

  private

  def mpg
    @miles / gallons
  end

  def ppm
    @price * 100 / @miles
  end

  def gallons
    @litres / 4.546
  end

end
