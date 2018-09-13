require 'csv'
require 'pry'
require_relative 'date_range'
require_relative 'movie'
require_relative 'rental'


module GreenBox
  class MovieReserver
    attr_accessor :movies, :rentals, :date_range
    # :reserver, :date_range

    def initialize
      @movies = MovieReserver.load_movies
      @rentals = []
      @date_range = GreenBox::DateRange.new(Time.parse('2018-08-08'),Time.parse('2018-08-09'))
    end

      # `self.load_movies`: This method will open the csv file `movies.csv` and read in the movies and return an array of the given movies.  Note the actors are separated by the `:` character.  You will need to break up that field.
    def self.load_movies
      showtime_movies  = []

      CSV.read('data/movies.csv', headers: false).each do |line|
        movie_id = line[0].to_i
        title = line[1]
        publisher = line[2]
        all_actors = line[3]
        actors_names = all_actors.split(':')
        actors = {actors: actors_names}

        showtime_movies << GreenBox::Movie.new(movie_id, title, publisher, actors)
      end
      return showtime_movies
    end


    # `available_movies(date_range)`:  This method will take a `DateRange` instance and return a list of
    #  movies available (not rented yet) in that range.
    def available_movies(date_range)

      # @movies = available_movies
      # If @rentals = [] - is empty,
        if @rentals.empty?
          # then all the movies are available
          return @movies
        else
          # @movies is a MovieReserver object that contains movies.
          available_movies = []
          @movies.each do |movie|
            if @rentals.date_range == date_range
              available_movies << movie
            end
          end
          return @rentals
        end
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

        # if @rentals.length > 0
        #   @rentals.each do |movies|
        #     date_range
        #     if @movies.include(date_range)
        #       available_movies = @movies.delete(date_range)
        #     end

          # @rentals.each do |movie|
          #   movie.id
          #   if @movies.include(movie.id)
          #   available_movies = @movies.delete(movie.id)
        #     end

        # end

      # end

    # *   `rent_movie(movie_title, date_range, customer_name)`:  This method will attempt to reserve a movie with the given title for the given date range.  If the movie is not available in that range the method should raise a `StandardError`.

    def rent_movie(movie_title, date_range, customer_name)
      @movies.each do |movie|
        if movie.title == movie_title
          @rentals << movie
          return @rentals
        end
      end
      # If we finish the loop and nothing is found, raise an error here.
      raise ArgumentError.new("No movies found!")
    end
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
