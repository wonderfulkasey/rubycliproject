class Fortune::Company

  attr_accessor :name, :hq, :industry

  def self.new
    self.scrape_company
  end

  def self.scrape_company
    company = []

    company << self.scrape_fortune
  end

   def self.scrape_fortune
    doc = Nokogiri::HTML(open("https://fortune.com/best-companies/"))

  
    deal.name = doc.search("section.features h2").text.strip
    deal.price = doc.search("button.buy-button").text.gsub("Buy it.", "").strip
    deal.url = "https://fortune.com/best-companies/"
    deal.availability = true

    deal
  end
end