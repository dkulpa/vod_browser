class FilmwebParser < Struct.new(:link)
  def parse
    Nokogiri::HTML(open(link)).css("table")[0].children[1].children.map do |child|
      if child.attributes["sorttable_customkey"].value.length > 3 && release_date_from_past?(child.children[1].children[1].text)
        child.attributes["sorttable_customkey"].value
      end
    end
  end

  private

  def release_date_from_past?(object)
    object.from(2).to(3).to_i <= Time.now.year
  end
end
