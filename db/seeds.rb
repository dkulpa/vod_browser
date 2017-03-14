movies_links = Nokogiri::HTML(open('http://www.filmweb.pl/user/kulpadawid/films/wanna-see')).css("table")[0].css("td").map do |m|
  if m.attributes["sorttable_customkey"].value.length > 3 && m.css('div')[0].children[1].text.slice(2..5).to_i <= Time.now.year
    m.css("a")[1].attributes["href"].value
  end
end.compact

movies_links.each do |link|
  movie_page = Nokogiri::HTML(open("http://www.filmweb.pl#{link}"))
  if movie_page.css("div.filmMainHeader").css("time").present? && movie_page.css("span.ratingRateValue").present?
    title = movie_page.css("div.filmMainHeader").css("h1.inline.filmTitle").css('a').children.text
    year = movie_page.css("div.filmMainHeader").css("h1.inline.filmTitle").css('span').children.text[/\d{4}/].to_i
    time = movie_page.css("div.filmMainHeader").css("time").children[0].text.chomp(' min').to_i
    rating = movie_page.css("span.ratingRateValue").children[0].children.text.sub!(',', '.').to_f

    Movie.create!(title: title, year: year, time: time, rating: rating)
  end
end
