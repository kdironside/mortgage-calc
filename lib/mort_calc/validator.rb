module Validator
        
  def validator(data_object)      
    @user_input = data_object == "amount" ? self.getamt : data_object == "interest" ? self.getinterest : self.getyears    
  end
  
  def getamt
    @output.puts 'Enter principal amount in U.S.dollars:'           
    usdollaramt = gets.chomp
    @amount = usdollaramt.to_i  
    if @amount.between?(100,100000000)
      @output.puts 'Principal Amount is: ' + usdollaramt
    else 
      @output.puts 'Oops, Principal Amount must be between $100 and $100M'
    end
    return @amount
  end  
  
  def getinterest           
    @output.puts 'Enter annual interest rate between 0.125% and 30.0% using up to 3 decimals:'    
    intrate = gets.chomp 
    @interest = intrate.to_i*1000 
    if @interest.between?(0.125,30.0)
      @output.puts 'Interest Rate is: ' + intrate
    else 
      @output.puts 'Oops, Interest Rate must be between 0.125 and 30 percent'
    end
    return @interest
  end
  
  def getyears 
    @output.puts 'Enter the length of the loan in years:'          
    years = gets.chomp          
    @term_years = years.to_i
    if @term_years.between?(1,30)
      @output.puts 'The Term Length is: ' + years + ' years'
    else 
      @output.puts 'Oops, loan length must be between 1 and 30 years'
    end
    return @term_years
  end
  
end