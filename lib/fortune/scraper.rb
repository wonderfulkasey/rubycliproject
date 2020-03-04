class Fortune::Scraper

  def get_page
    Nokogiri::HTML(open("https://fortune.com/best-companies/"))
  end

  def scrape_fortune_index
     self.get_page.css("div#t1-50 li")
  end

  def make_restaurants
    scrape_restaurants_index.each do |r|
      WorldsBestRestaurants::Restaurant.new_from_index_page(r)
    end
  end
end