class Airport < ApplicationRecord
  has_many :departing_flights, class_name: 'Flight', foreign_key: 'departure_airport_id'
  has_many :arriving_flights, class_name: 'Flight', foreign_key: 'arrival_airport_id'

  scope :departure_airports, -> { order(:code).find(Flight.pluck(:departure_airport_id)).map { |airport| [airport.code, airport.id] } }
  scope :arrival_airports, -> { order(:code).find(Flight.pluck(:arrival_airport_id)).map { |airport| [airport.code, airport.id] } }
end
