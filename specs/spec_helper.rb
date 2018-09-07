require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'awesome_print'
# Add simplecov

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative '../lib/rental'
require_relative '../lib/movie'
require_relative '../lib/date_range'
# require_relative '../lib/movie_reserver'
