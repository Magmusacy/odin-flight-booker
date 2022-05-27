class BookingsController < ApplicationController
  def new
    @booking = Booking.new

    if query_params_present?
      prepare_booking
    else
      redirect_to root_path
    end
  end

  def create
    @booking = Booking.new(booking_parameters)

    if @booking.save
      redirect_to @booking
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_parameters
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email] )
  end

  def query_params_present?
    true if [:flight, :passanger_count].all? { |el| params.has_key?(el) }
  end

  def prepare_booking
    @passengers = Array.new(params[:passanger_count].to_i) { Passenger.new }
    @booking.passengers << @passengers
    @booking.flight_id = Flight.find(params[:flight]).id
  end
end
