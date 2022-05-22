class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  scope :formatted_dates, -> { order(:start_datetime).pluck(:start_datetime).map { |date| date.strftime("%d/%m/%Y") }.uniq }

  def formatted_datetime
    start_datetime.strftime("%d/%m/%Y - %H:%M")
  end
end
