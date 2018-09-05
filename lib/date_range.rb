require 'time'

module GreenBox
  class DateRange
    attr_reader :start_date , :end_date

    def initialize(start_date, end_date)
      @start_date = start_date
      @end_date = end_date

      if start_date > end_date
        raise ArgumentError.new "The end date is before the start date"
      end
    end


    def contains(date)
      if ((date = start_date) || (date > start_date)) && (date < end_date)
        return true
      elsif
        date < start_date || date = end_date
        return false
      end
    end



    def overlaps(other_date_range)
    end

    def nights
    end

  end
end
