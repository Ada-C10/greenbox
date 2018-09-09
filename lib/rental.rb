require_relative 'date_range'
require 'time'
require_relative 'movie'


module GreenBox
  class Rental
    attr_accessor :movie, :date_range, :customer

    def initialize(movie, date_range, customer)
      if date_range.nights <= 0
        raise ArgumentError.new "This is an illegal date range"
      end
      @movie = movie
      @date_range = date_range
      @customer = customer
    end


    def cost
      rent = @date_range.nights
      cost = rent * 3.0
      return cost.round(2)
    end
  end
end
