class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def cineman
    @movies = Movie.all
    @cineman_movies = PageParser.new('http://www.cineman.pl/wszystkie').parse_cineman_movies(@movies.collect(&:title))
  end
end
