require 'time'
require_relative 'movie_reserver'

module GreenBox
  # When a movie is being rented you need to understand when that rental occurs.  To represent that interval of time, you will create a `DateRange` class.
  class DateRange
    attr_reader :start_date , :end_date, :nights

    def initialize(start_date, end_date)
      @start_date = start_date
      @end_date = end_date

      if start_date > end_date
        raise ArgumentError.new "The end date is before the start date"
      end
    end

#  `contains(date)` - This method returns true if the date occurs on or after the start date and before the end date.
    def contains(date)
      if (date >= @start_date) && (date < @end_date)
        return true
      else
        date < @start_date || date >= @end_date
        return false
      end
    end


# `overlaps(other_date_range)` - This method takes another date range as a parameter and returns `true` if the date ranges overlap.
    def overlaps(other_date_range)
      if contains(other_date_range.start_date) || contains(other_date_range.end_date)
        true
      elsif other_date_range.contains(@start_date) && other_date_range.contains(@end_date)
        true
      else
        false
      end
    end

# `nights` - This method will return the number of nights included in the given `DateRange.
    def nights
      count = (@end_date - @start_date)/(60*60*24)
      return count
    end
  end
end
