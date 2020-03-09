class Fortune::Company

attr_accessor :number, :name, :website_url 

  
  @@all = []
  
  def initialize(hash)
    hash.each {|k, v| self.send("#{k}=", v)}
    @@all << self
  end
  
  def self.display_details(index)
    c = self.all[index]
    puts "---------------"
    puts "That company is #{c.name}."
    puts "Here are some details about #{c.name}:"
    puts "Phone:" + " #{c.number}"
    puts "Website:" + " #{c.website_url}"
    puts "---------------"
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
    
end