require_relative 'date_range'
require 'time'
require_relative 'movie'


module GreenBox
  # A `Rental` represents a movie rental in the system.
  class Rental
    attr_accessor :movie, :date_range, :customer

    def initialize(movie, date_range, customer)
      if date_range.nights <= 0
        raise ArgumentError.new "This is an illegal date range"
      end
      @movie = movie
      @date_range = date_range
      # *   customer:  The name of the customer making the rental
      @customer = customer
    end

# *   `cost`:  This method will return the cost of the rental.  A movie rental will cost $3.0 per night.  The customer is **not** charged for the day the movie is checked in.  So a movie checked out on August 8th and checked in August 10th would cost $3.00 * 2 days = $6.00
    def cost
      rent = @date_range.nights
      cost = rent * 3.0
      return cost.round(2)
    end
  end
end
