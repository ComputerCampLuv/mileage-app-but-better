class PartialFillsController < ApplicationController
  def index
    @cars = Car.all
  end

  def new
    @partial_fill = PartialFill.new
    @partial_fill[:fully_filled] = true
  end

  def create
    @partial_fill = PartialFill.new(partial_fill_params)
    @complete = @partial_fill[:fully_filled]
    @car = Car.find(params[:partial_fill][:car_id])

    if @car.full_fills.last.complete
      @partial_fill.full_fill = FullFill.create(complete: @complete, car: @car)
    else
      @partial_fill.full_fill = @car.full_fills.last
      @car.full_fills.last.update(complete: @complete, car: @car)
    end

    if @partial_fill.fully_filled
      @partial_fill.full_fill.set_variables
    end

    if @partial_fill.save
      flash[:notice] = "Saved!"
      redirect_to partial_fills_path
    else
      flash[:alert] = "Nope!"
      render 'new'
    end

  end

  private

  def partial_fill_params
    params.require(:partial_fill).permit(:price_per_litre, :total_price, :miles_complete, :fully_filled)
  end
end
