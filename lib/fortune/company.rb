class Fortune::Company

  attr_accessor :name, :hq, :industry

  @@all = []

  def self.new_from_index_page(r)
    self.new(
      r.css("h2").text,
      "https://fortune.com/best-companies/#{r.css("a").attribute("href").text}",
      r.css("h3").text,
      r.css(".position").text
      )
  end

  def initialize(name=nil, url=nil, location=nil, position=nil)
    @name = name
    @hq = hq
    @industry = industry
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def name
    @best_dish ||= doc.css("div.c-4.nr.nt ul:nth-child(8) li").text
    # @best_dish ||= doc.xpath("//div[@class='c-4 nr nt']/ul[3]/li").text
  end

  def hq
    @food_style ||= doc.css("div.c-4.nr.nt ul:nth-child(6) li").text
    # @food_style ||= doc.xpath("//div[@class='c-4 nr nt']/ul[2]/li").text
  end

  def industry
    @contact ||= doc.css("div.c-4.nr.nt ul:nth-child(10) li:nth-child(1)").text.split("+").join(". Tel: +")
    # @contact ||= doc.xpath("//div[@class='c-4 nr nt']/ul[4]/li[1]").text.split("+").join(". Tel: +")
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
end