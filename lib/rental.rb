require_relative 'date_range'

module GreenBox
  class Rental < DateRange
    attr_reader :date_range, :movie, :customer


    def initialize(date_range, movie, customer)
      @date_range = date_range
      @movie = movies
      @customer = customer
    end
  end



  def cost
    count = (end_date - start_date)/(60*60*24)
    cost = count * 3
    return "The cost of renting a movie for #{count} days is $ #{cost}"
  end


end
