require 'csv'
require_relative 'date_range'
require_relative 'movie'
require_relative 'rental'


module GreenBox
  class MovieReserver
    attr_accessor :movies,:rentals,:reserver, :date_range

    def initialize
      @movies = MovieReserver.load_movies
      @rentals = []
      @reserver = reserver
      @date_range = date_range
    end

    def self.load_movies
      showtime_movies  = []

      CSV.read('data/movies.csv', headers: false).each do |line|
        movie_id = line[0].to_i
        title = line[1]
        publisher = line[2]
        all_actors = line[3]
        actors_names = all_actors.split(':')
        actors = {actors: actors_names}

        showtime_movies << GreenBox::Movie.new(movie_id,title,publisher,actors)
      end

      return showtime_movies

    end



    # `available_movies(date_range)`:  This method will take a `DateRange` instance and return a list of movies available (not rented yet) in that range.
    def available_movies(date_range)
      available_movies = @movies.map do |movie|
        if movie.date_range <= 0
          return available_movies
        else
          @rentals << movie
        end
      end

    end
    # movies not rented yet = showtime_movies
    # movies rented = rentals

    # available_movies << GreenBox::Movie.new(movie_id,title,publisher,actors)
    # available_movies = MovieReserver.load_movies

    # @rentals = available_movies.each do |date_range|
    #   if @rentals.date_range <= 0
    #     @rentals << movie
    #   end
    # end
    # # return available_movies



    # `rent_movie(movie_title, date_range, customer_name)`:  This method will attempt to reserve a movie with the given title for the given date range.  If the movie is not available in that range the method should raise a `StandardError`.
    #  -   Note:  This method's tests are not completely written.  You will need to fill-in the provided `it` blocks
    def rent_movie(movie_title, date_range, customer_name)
    end

  end
  # reserver = GreenBox::MovieReserver.new
  # date_range = GreenBox::DateRange.new(Time.parse('2018-08-08'), Time.parse('2018-08-09')
end
