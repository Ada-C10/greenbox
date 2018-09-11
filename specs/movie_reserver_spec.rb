require_relative 'spec_helper'

MOVIES_IN_CSV = 11

describe 'GreenBox::MovieReserver' do
  let (:reserver) { GreenBox::MovieReserver.new }
  let (:date_range) { GreenBox::DateRange.new(Time.parse('2018-08-08'), Time.parse('2018-08-09')) }

  describe 'initialization' do

    it 'can be instantiated' do
      expect(reserver).must_be_instance_of GreenBox::MovieReserver
    end

    it 'has the proper number of movies' do
      expect(reserver.movies.length).must_equal MOVIES_IN_CSV
    end
  end

  describe 'load_movies' do
    let (:movie_list) { GreenBox::MovieReserver.load_movies }

    it 'loads the right number of movies' do
      expect(movie_list.length).must_equal MOVIES_IN_CSV
    end

    it 'loads the 1st movie' do
      first_movie = movie_list.first

      expect(first_movie.title).must_equal 'Green Lantern'
      expect(first_movie.id).must_equal 1
      expect(first_movie.publisher).must_equal 'Fox'
    end

    it 'loads the last movie' do
      last_movie = movie_list.last

      expect(last_movie.title).must_equal 'Crazy Rich Asians'
      expect(last_movie.id).must_equal 11
      expect(last_movie.publisher).must_equal 'Warner Bros'
    end

    it 'loads the right actors' do
      first_movie = movie_list.first

      expect(first_movie.actors).must_include 'Blake Lively'

      last_movie = movie_list.last

      expect(last_movie.actors).must_include 'Constance Wu'
    end
  end

  describe 'movies available' do

    it 'will list the available movies' do
      available_movies = reserver.available_movies(date_range)

      expect(available_movies.length).must_equal 11
    end

    it 'will not include rented movies' do
      date_range = GreenBox::DateRange.new(Time.parse('2018-08-08'), Time.parse('2018-08-09'))
      reserver.rent_movie('Crazy Rich Asians', date_range, 'Ada Lovelace')

      available_movies = reserver.available_movies(date_range)
      expect(available_movies.length).must_equal 10

      movie_id = 2
      movie_id_2 = available_movies.find do |movie|
        movie.id == movie_id
      end

      expect(movie_id_2).must_be_nil
    end
  end

  describe 'rent_movie' do
    it 'returns a rental for a successfully rented movie' do
      #Setup
      movie_reserver  = GreenBox::MovieReserver.new
      title = 'Crazy Rich Asians'
      date_range = GreenBox::DateRange.new(Time.parse('2018-08-08'),Time.parse('2018-08-09'))
      customer_name = ' Sabine '

      #Method under testn(call the things that I am verifying)
      rental = movie_reserver.rent_movie(title, date_range, customer_name)

      #Assertions - something that has changed that tells
      #us we have the expected result
      expect(rental).wont_be_nil

    end


    it 'can rent multiple movies with the same title' do

      movie_reserver  = GreenBox::MovieReserver.new
      title = 'Crazy Rich Asians'

      date_range_a = GreenBox::DateRange.new(Time.parse('2018-08-09'),Time.parse('2018-08-10'))
      customer_name_a = ' Andrew '

      date_range_b = GreenBox::DateRange.new(Time.parse('2018-08-08'),Time.parse('2018-08-09'))
      customer_name_b = ' Sabine '

      rental_a = movie_reserver.rent_movie(title, date_range_a, customer_name_a)

      rental_b = movie_reserver.rent_movie(title, date_range_b, customer_name_b)

      expect(rental_a).wont_be_nil
      expect(rental_b).wont_be_nil
      expect(rental_a).wont_equal(rental_b)


    end



    it 'cannot rent a movie already rented' do

      movie_reserver  = GreenBox::MovieReserver.new
      title = 'Crazy Rich Asians'
      date_range = GreenBox::DateRange.new(Time.parse('2018-08-08'),Time.parse('2018-08-09'))
      customer_name = ' Sabine '

      #Method under test(call the things that I am verifying)
      rental_a = movie_reserver.rent_movie(title, date_range, customer_name)
      rental_b = movie_reserver.rent_movie(title, date_range, customer_name)

      #Assertions/Expectation - something that has changed that tells
      #us we have the expected result
      expect(rental_a).wont_be_nil
      expect(rental_b).must_be_nil
      # expect(rental_a).must_equal(rental_b)
    end

    it 'raises an error if a movie is requested that does not appear in the list' do

      movie_reserver  = GreenBox::MovieReserver.new
      title = 'Crazy Rich Asians'
      date_range = GreenBox::DateRange.new(Time.parse('2018-08-08'),Time.parse('2018-08-09'))
      customer_name = ' Sabine '

      # checking for errors
      expect {
        movie_reserver.rent_movie(title, date_range, customer_name)

        # (the "method under test" section goes inside!)
      }.must_raise StandardError

    end
  end
end
