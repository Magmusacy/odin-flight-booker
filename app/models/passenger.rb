class Passenger < ApplicationRecord
  belongs_to :booking
  has_one :flight, through: :booking

  validates :name, :email, presence: true
end
