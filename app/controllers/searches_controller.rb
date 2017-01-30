class SearchesController < ApplicationController
  def show
    @movie_to_find = Search.last.text
  end

  def new
    @search = Search.new
    @filmweb_wanna_see_link = 'http://www.filmweb.pl/user/kulpadawid/films/wanna-see'
    @wanna_see_movies = FilmwebParser.new(@filmweb_wanna_see_link).parse
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
