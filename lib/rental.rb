require_relative 'date_range'
require 'time'
require_relative 'movie'

module GreenBox
  class Rental
    # attr_reader :movie, :start_date, :end_date, :customer
    attr_writer :movie, :date_range , :customer


    # def initialize(movie, start_date, end_date, customer)
    def initialize(movie, date_range = end_date - start_date, customer)
      @movie = movie
      # @start_date = Time.parse(start_date)
      # @end_date = Time.parse(end_date)
      @date_range = Time.parse.date_range
      @customer = customer


    # For future I would say make an instance of a date_range class and call a
      # date_range =
      if date_range = ('2018-08-09' - '2018-08-09')
        raise ArgumentError.new "This is an illegal date range"
      end

    end
   # rental = GreenBox::Rental
   rental = GreenBox::Rental.new("Princess Bride", 3, "Abi")

    def cost
      count = (end_date - start_date)/(60*60*24)
      cost = count * 3
      return "The cost of renting a movie for #{count} days is $ #{cost}"
    end


  end
end

# rental = GreenBox::Rental.new("Princess Bride", '3', "Abi")
