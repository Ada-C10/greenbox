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
      # date_range.nights returns an integer of total nights 
      # need to subtract one night (day) to calculate correct cost
      rent = @date_range.nights
      # cost is number of days multipled by three dollars (per day) 
      cost = rent * 3.0
      # rounding should return the correct cents. 
      return cost.round(2) 
    end
  end
end