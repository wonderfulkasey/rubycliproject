class Fortune::CLI

  def call 
    welcome
    search_companies
    company_details
  end
  
  def welcome 
    puts "Welcome to an interactive list of the Top Ten Fortune 100 Companies! Let's find you a new job."
  end
  
  def search_companies
    puts "Are you ready to learn about current Top 10 companies?"

    #puts "or all the breweries in your zip code? Please type 'zip' or 'state'."

    choice = gets.strip.downcase
    
    if choice == "yes"
      puts "Great!"
      input = gets.strip.to_i
      Fortune::API.companies_yes(input)
      display_yes
    else
      puts "I'm sorry, I don't understand your input."
    end
  end
    
  def display_yes
    puts ""
    Fortune::Company.all.each.with_index(1) {|b, i| puts "#{i})" + " #{c.name}"}
    puts ""
    puts "Which company would you like to learn about? Please enter a number."
  end
  
  def company_details
    input = nil 
    while input != "exit" 
    puts "You can type 'start over' to search again or 'exit'."
  
    input = gets.strip.downcase
      if input == "exit"
        goodbye
      elsif input.to_i > 0 && input.to_i <= Fortune::Company.all.length
        Fortune::Company.display_details(input.to_i-1)
        puts "Pick a new number from the list to learn about another company."
      elsif input == "start over"
        Fortune::Company.destroy_all
        search_companies
      else
        puts "Not sure what you meant... Please pick a number from the list."
      end
     end
  end
  
  def goodbye
    Fortune::Company.destroy_all
    puts "Thank you for stopping by!"
  end
  
end  