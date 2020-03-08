class Fortune::CLI

  def call
    welcome
    search_company
    goodbye
  end

  def welcome
    puts "Welcome to the Fortune 100 Companies!"
  end


  def search_company
    input = nil
    while input != "exit"
      puts "Enter the number of the company you'd like to know more about or type list to see the options or type exit:"
      input = gets.strip.downcase

      if input.to_i > 0
        the_deal = @company[input.to_i-1]
        puts "#{company.name} - #{company.hq} - #{company.industry}"
      elsif input == "list"
        list_deals
      else
        puts "Not sure what you want to know - please type list or exit."
      end
    end
  end

  def goodbye
    puts "See you soon!"
  end
end
