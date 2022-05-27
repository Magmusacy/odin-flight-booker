class FlightsController < ApplicationController
  def index
    @available_flights = Flight.where(departure_airport_id: params[:departure_airport])
                                .where(arrival_airport_id:   params[:arrival_airport])
                                # this weird looking conversion must be present because LIKE isn't available for datetime types in sql
                                .where("to_char(start_datetime, 'dd/mm/yyyy') LIKE ?", params[:date])
                                # avoid N + 1 queries problem
                                .includes(:departure_airport, :arrival_airport)

    @passanger_count = params[:passanger_count]
    @departure_airports = Airport.departure_airports
    @arrival_airports = Airport.arrival_airports
    @available_dates = Flight.formatted_dates
  end
end
