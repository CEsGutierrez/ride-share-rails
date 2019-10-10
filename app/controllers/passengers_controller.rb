class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end
  
  def show
    @passenger = Passenger.find_by(id: params[:id])
    head :not_found if @passenger.nil?
  end
  
  def new
    @passenger = Passenger.new
  end
  
  def create
    @passenger = Passenger.create(passenger_params)
    if @passenger.save
      redirect_to passenger_path(@passenger.id)
    else
      render new_passenger_path
    end
  end
  
  
  
  private
  def passenger_params
    params.require(:passenger).permit(:name, :phone_num)
    
  end
end