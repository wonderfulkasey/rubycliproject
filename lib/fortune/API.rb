class Fortune::API

def self.companies_zip(zip)
    companies = HTTParty.get("https://api.openbrewerydb.org/breweries?by_postal=#{zip}")
    
    companies.each {|company_hash| Fortune::Company.new(company_hash)}
  end
  
  def self.companies_state(state)
    companies = HTTParty.get("https://api.openbrewerydb.org/breweries?per_page=50&by_state=#{state}")
    
    companies.each {|company_hash| Fortune::Company.new(company_hash)}
  end
  
end
