require 'flt'

module Validator
  include Flt
        
  def validator(data_object)      
    @user_input = data_object == "amount" ? self.getamt : data_object == "interest" ? self.getinterest : self.getyears    
  end
  
  def getamt
    @output.puts 'Enter principal amount in U.S.dollars:'           
    usdollaramt = gets.chomp
    usdollaramt = usdollaramt.to_s.gsub(/[^0-9.]+/, '')
    @amount = DecNum(usdollaramt).to_i  
    if @amount.between?(100,100000000)
      @output.puts 'The principal amount you entered is: ' + @amount.to_s
      @status = 'good'
    else
      @amount = 0 
      @output.puts 'Oops, Principal Amount must be between $100 and $100M!'
      @status = 'bad'
    end
    return @status, @amount 
  end  
  
  def getinterest
    @status == nil            
    @output.puts 'Enter annual interest rate between 0.125% and 30.0% (rounds to 3 decimals):'    
    intrate = gets.chomp
    intrate = intrate.to_s.gsub(/[^0-9.]+/, '')
    @interest = DecNum(intrate).round(:places=>3) 
    if @interest.between?(0.125,30.0)
      @output.puts 'The interest Rate you entered is: ' + @interest.to_s
      @status = 'good'
    else 
      @interest = 0
      @output.puts 'Oops, Interest Rate must be between 0.125 and 30 percent!'
      @status = 'bad'
    end
    return @status, @interest 
  end
  
  def getyears 
    @output.puts 'Enter the length of the loan in integer years:'          
    years = gets.chomp
    years = years.gsub(/[^0-9.]+/, '')          
    @term_years = years.to_i
    if @term_years.between?(1,30)
      @output.puts 'The term length you entered is: ' + @term_years.to_s + ' years'
      @status = 'good'
    else 
      @term_years = 0
      @output.puts 'Oops, loan length must be between 1 and 30 years!'
      @status = 'bad'
    end
    return @status, @term_years 
  end
end