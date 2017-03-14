class PageParser < Struct.new(:link)
  def parse_cineman_movies(list_of_movies)
    Nokogiri::HTML(open(link)).css("div.whiteBg.movieIndexPage")[0].children.css("ul").css("li").css("ul").css("li").css("a").collect do |movie|
      movie if list_of_movies.include?(movie.text)
    end.compact
  end
end
