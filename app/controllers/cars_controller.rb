class CarsController < ApplicationController
  before_action :set_car, except: [:index, :new, :create]

  def index
    #scope the cars down to the user that is logged in
    @cars = current_user.cars
  end

  def show
    #our before action is doing this for us
    # @car = Car.find(params[:id])
  end

  def new
    @car = current_user.cars.new
  end

  def create
    @car = current_user.cars.new(car_params)
      if @car.save
        #shorthand way of doing flash message(can only be done after redirect)
        redirect_to @car, notice: 'Car Created!'
      else
        render :new
      end
  end

  def edit
    #our before action is doing this for us
    # @car = Car.find(params[:id])
  end

  def update
    #our before action is doing this for us
    # @car = Car.find(params[:id])
      if @car.update(car_params)
        redirect_to @car
      else
        render :edit
      end
  end

  def destroy
    #our before aciton is doing this for us
    # @car = Car.find(params[:id])
    @car.destroy
    #long hand way of setting flash messages
    flash[:notice] = 'Car Deleted!'
    redirect_to cars_path
  end

  #before actions/strong params
private
  #strong params
  def car_params
    params.require(:car).permit(:make, :model, :color, :year, :mileage, :runs)
  end

  #before
  def set_car
    @car = current_user.cars.find(params[:id])
  end

end
