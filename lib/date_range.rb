require 'time'

module GreenBox
  class DateRange
    attr_reader :start_date , :end_date

    def initialize(start_date, end_date)
      @start_date = start_date
      @end_date = end_date
      # date_range = GreenBox::DateRange.new(Time.parse('2018-08-08'),
      #                                      Time.parse('2018-08-10'))

      if GreenBox::DateRange.new(Time.parse('2018-08-09'),
                                               Time.parse('2018-08-08'))
        raise ArgumentError.new "The end date is before the start date"
      end
    end

    def contains(date)
    end

    def overlaps(other_date_range)
    end

    def nights
    end

    
  end
end
