# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


def random_date
  DateTime.now + (rand * 100).to_i
end

# This makes it possible for a flight to depart and arrive at the same airport which is pretty silly
def random_airport_id
  Airport.pluck(:id).sample
end

def random_duration
  (rand * 100).to_i
end

def populate_airport
  Airport.delete_all
  ActiveRecord::Base.connection.reset_pk_sequence!('airports')
  codes = %w[SFO NYC LAX ATL DFW LAS SHA]
  codes.each { |code| Airport.create(code: code) }
end

def populate_flights
  Flight.delete_all
  1000.times { Flight.create({ departure_airport_id: random_airport_id, arrival_airport_id: random_airport_id, start_datetime: random_date, duration: random_duration }) }
  Flight.create({ departure_airport_id: 4, arrival_airport_id: 4, start_datetime: DateTime.parse('21/05/2022'), duration: 0})
end

populate_airport
populate_flights