module Admin
  class CarsController < ApplicationController
    before_action :verify_admin!

    def new
      @car = Car.new
    end

    def create
      @car = Car.new(car_params)

      if @car.save
        flash[:notice] = 'Car created.'
        redirect_to new_admin_car_path
      else
        render 'new'
      end
    end

    protected
    def car_params
      params.require(:car).permit(:make,
        :model, :year, :price, :color, :description)
    end

    def verify_admin!
      if !current_user.admin?
        flash[:notice] = 'Access denied.'
        redirect_to root_path
      end
    end
  end
end
