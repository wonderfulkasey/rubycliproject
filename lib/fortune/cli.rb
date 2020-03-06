class Fortune::CLI

  def call
    list_companies
    #maybe just list?
    menu
    goodbye
  end

  def list_companies
    # here doc - http://blog.jayfields.com/2006/12/ruby-multiline-strings-here-doc-or.html
    puts "Top 10 Companies To Work For:"
    @company = Fortune::Company.today
    @company.each.with_index(1) do |company, i|
      puts "#{i}. #{company.name} - #{company.hq} - #{company.industry}"
    end
  end

  def menu
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
