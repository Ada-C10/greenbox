require_relative 'date_range'
require 'time'
require_relative 'movie'

module GreenBox
  class Rental
    attr_reader :movie,:date_range,:customer


    def initialize(movie, date_range, customer)
      @movie = movie
      @date_range = date_range
      @customer = customer

      if
        date_range = GreenBox::DateRange.new(start_date = end_date))
        raise ArgumentError.new "The date range is illegal"
      end
    end
      rental = GreenBox::Rental.new(movie, date_range, 'Ada Lovelace')


    def cost
      count = (end_date - start_date)/(60*60*24)
      cost = count * 3
      return "The cost of renting a movie for #{count} days is $ #{cost}"
    end


  end
end
