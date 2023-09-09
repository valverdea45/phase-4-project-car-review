class CarsController < ApplicationController

    skip_before_action :authorize, only: [:index]

    def create
        new_car = Car.create!(car_params)
        render json: new_car, status: :ok
    end

    def index
        car = Car.find_by(car_params)
        render json: car, include: [:reviews], status: :ok
    end

    private

    def car_params
        params.permit(:year, :make, :model)
    end

end