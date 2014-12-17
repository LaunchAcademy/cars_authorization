class CarsController < ApplicationController
  def index
    @cars = Car.all.limit(50)
  end
end
