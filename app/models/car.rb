class Car < ApplicationRecord

#associations
  belongs_to :user

#validations
validates_presence_of :make, :model, :color, :year, :mileage

#callbakcs
#instance methods
#example: Car.find(1).info
def info
  "The car with Make: #{make} - #{model} has the color of #{color}"
end
#class methods
#example @cars = Car.all.by_year
def self.by_year
  #order(year: :desc)
  order(:year)
end
end
