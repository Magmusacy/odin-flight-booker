# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


def populate_airport
  Airport.delete_all
  ActiveRecord::Base.connection.reset_pk_sequence!('airports')
  codes = %w[SFO NYC LAX ATL DFW LAS SHA]
  codes.each { |code| Airport.create(code: code) }
end

def populate_flights
  Flight.delete_all
  Flight.create([
     { departure_airport_id: 1, arrival_airport_id: 2, start_datetime: DateTime.now, duration: 69 },
     { departure_airport_id: 2, arrival_airport_id: 3, start_datetime: DateTime.now, duration: 63 },
     { departure_airport_id: 3, arrival_airport_id: 4, start_datetime: DateTime.now, duration: 23 },
     { departure_airport_id: 4, arrival_airport_id: 5, start_datetime: DateTime.now, duration: 43 },
     { departure_airport_id: 5, arrival_airport_id: 6, start_datetime: DateTime.now, duration: 32 },
     { departure_airport_id: 6, arrival_airport_id: 7, start_datetime: DateTime.now, duration: 1029 }
    ])
end

populate_airport
populate_flights