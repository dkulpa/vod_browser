class PageParser < Struct.new(:link)
  def parse_filmweb_titles
    Nokogiri::HTML(open(link)).css("table")[0].css("td").map do |child|
      if child.attributes["sorttable_customkey"].value.length > 3 && release_date_from_past?(child.children[1].children[1].text)
        child.attributes["sorttable_customkey"].value
      end
    end.compact
  end

  def parse_cineman_movies(list_of_movies)
    Nokogiri::HTML(open(link)).css("div.whiteBg.movieIndexPage")[0].children.css("ul").css("li").css("ul").css("li").css("a").collect do |movie|
      movie if list_of_movies.include?(movie.text)
    end.compact
  end

  private

  def release_date_from_past?(object)
    object.from(2).to(3).to_i <= Time.now.year
  end
end
