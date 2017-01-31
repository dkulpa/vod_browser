class SearchesController < ApplicationController
  def show
    @movie_to_find = Search.last.text
  end

  def new
    @search = Search.new
    @wanna_see_movies = PageParser.new('http://www.filmweb.pl/user/kulpadawid/films/wanna-see').parse_filmweb_titles
    @my_movies_in_cineman = PageParser.new('http://www.cineman.pl/wszystkie').parse_cineman_movies(@wanna_see_movies)
  end

  def create
    @search = Search.new(search_params)

    if @search.save
      redirect_to '/searches/show'
    else
      render :new
    end
  end

  private
  def search_params
    params.require(:search).permit(:text)
  end
end
