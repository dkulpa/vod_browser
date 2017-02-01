require 'rails_helper'

RSpec.describe Movie do
  describe 'validations' do
    it 'enforces title to be present' do
      movie = Movie.new
      movie.valid?
      expect(movie.errors.messages[:title]).to include("can't be blank")
    end

    it 'does not return errors if title is present' do
      movie = Movie.new
      movie.title = 'Tomb Raider'
      movie.valid?
      expect(movie.errors.messages[:title]).to_not include("can't be blank")
    end

    it 'enforces year to be present' do
      movie = Movie.new
      movie.valid?
      expect(movie.errors.messages[:year]).to include("can't be blank")
    end

    it 'does not return errors if year is present' do
      movie = Movie.new
      movie.year = 2017
      movie.valid?
      expect(movie.errors.messages[:year]).to_not include("can't be blank")
    end

    it 'enforces time to be present' do
      movie = Movie.new
      movie.valid?
      expect(movie.errors.messages[:time]).to include("can't be blank")
    end

    it 'does not return errors if time is present' do
      movie = Movie.new
      movie.time = 121
      movie.valid?
      expect(movie.errors.messages[:time]).to_not include("can't be blank")
    end

    it 'enforces rating to be present' do
      movie = Movie.new
      movie.valid?
      expect(movie.errors.messages[:rating]).to include("can't be blank")
    end

    it 'does not return errors if rating is present' do
      movie = Movie.new
      movie.rating = 7.3
      movie.valid?
      expect(movie.errors.messages[:rating]).to_not include("can't be blank")
    end

    it 'enforces year to be between 1908 and current year' do
      movie = Movie.new
      movie1 = Movie.new
      movie.year = 2018
      movie1.year = 1722
      movie.valid?
      movie1.valid?
      expect(movie.errors.messages[:year]).to include("wrong year")
      expect(movie1.errors.messages[:year]).to include("wrong year")
    end

    it 'does not return errors if year is current year or past' do
      movie = Movie.new
      movie.year = Time.now.year
      movie.valid?
      expect(movie.errors.messages[:year]).to_not include("wrong year")
    end

    it 'enforces rating to be between 0 and 10' do
      movie = Movie.new
      movie1 = Movie.new
      movie.rating = -2
      movie1.rating = 12
      movie.valid?
      movie1.valid?
      expect(movie.errors.messages[:rating]).to include("wrong rating")
      expect(movie1.errors.messages[:rating]).to include("wrong rating")
    end
  end
end
