class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    if query_params_present?
      @passengers = Array.new(params[:passanger_count].to_i) { Passenger.new }
      @booking.passengers << @passengers
      @booking.flight_id = Flight.find(params[:flight]).id
    else
      redirect_to root_path
    end
  end

  def create
  end

  private

  def query_params_present?
    true if [:flight, :passanger_count].all? { |el| params.has_key?(el) }
  end
end
