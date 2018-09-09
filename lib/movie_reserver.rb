require 'csv'
require 'pry'
require_relative 'date_range'
require_relative 'movie'
require_relative 'rental'


module GreenBox
  class MovieReserver
    attr_accessor :movies,:rentals
    # :reserver, :date_range

    def initialize
      @movies = MovieReserver.load_movies
      @rentals = []
      @date_range = GreenBox::DateRange.new(Time.parse('2018-08-08'),Time.parse('2018-08-09'))

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

    def available_movies(date_range)
      # If @rentals = [] - is empty,
      if @rentals = []
        # then all the movies are available
        return @movies
      end
      #PSEUDOCODE
      # If there is a movie in rentals
      ##### Want to check what movies are in rentals
      # that fall into that date date_range
      # and remove that movie only
      # will need to use a data structure to only use the ID that are in the date_range
      #use data structure to store those and match
      # them with the ones in the movie list
      #

      if @rentals.length > 0
        @rentals.each do |movie|
          movie.id
          if @movies.include(movie.id)
          available_movies = @movies.delete(movie.id)
          end
        end
      end
    end
  end

  def rent_movie(movie_title, date_range, customer_name)
  end

end



# available_movies = @rentals.map do |movie|
#   if @rentals.date_range.contains(movie.id)
#     return available_movies
#   else
#     @rentals << movie
#   end
# end
# movies not rented yet = showtime_movies
# movies rented = rentals
#
# available_movies << GreenBox::Rental.new(movie,date_range)
#
# available_movies = MovieReserver.load_movies
#
# @rentals = available_movies.each do |date_range|
#   if @rentals.date_range <= 0
#     @rentals << movie
#   end
# end
# return available_movies



# `rent_movie(movie_title, date_range, customer_name)`:  This method will attempt to reserve a movie with the given title for the given date range.  If the movie is not available in that range the method should raise a `StandardError`.
#  -   Note:  This method's tests are not completely written.  You will need to fill-in the provided `it` blocks



# reserver = GreenBox::MovieReserver.new
# date_range = GreenBox::DateRange.new(Time.parse('2018-08-08'), Time.parse('2018-08-09')
