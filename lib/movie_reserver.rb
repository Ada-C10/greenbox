require 'csv'
require_relative 'date_range'
require_relative 'movie'
require_relative 'rental'


module GreenBox
  class MovieReserver
    attr_reader :movies,:rentals

    def initialize(movies,rentals)
      @movies = load_movies
      @rentals = rentals
    end

     # reservation = GreenBox::MovieReserver.new(movies,rentals)

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
    end

    def rent_movie(movie_title, date_range, customer_name)
    end

  end
end
