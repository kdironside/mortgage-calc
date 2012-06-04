require 'flt'                     # rubygem to convert float to decimal 

module Validator
  include Flt
        
  def validator(obj)
    prompt_message(obj)
    @status = 'pending'
    while @status == 'pending' 
      input = gets.chomp
      return nil if input == ''           
      @user_input = obj == "amount" ? self.getamt(input) : obj == "interest" ? self.getint(input) : self.getyrs(input) 
    end
    return input          # dummy, not really used other than to prevent premature exit.
  end
  
  
  def prompt_message(obj)
    @output.puts 'Enter principal amount in U.S.dollars:'                                     if obj == "amount"
    @output.puts 'Enter annual interest rate between 0.125% and 35% (rounds to 3 decimals):'  if obj == "interest" 
    @output.puts 'Enter the length of the loan in integer years (up to 99):'                  if obj == "term_years"    
  end
  
  
# strip non-numeric chars except "." truncate decimals, validate range, display result 
  def getamt(input)           
    usdollaramt = input.to_s.gsub(/[^0-9.]+/, '')
    @amount = usdollaramt.to_i
    if @amount.between?(100,100000000)
      @output.puts 'The principal amount you entered is: ' + @amount.to_s
      @status = 'valid'
    else
      @output.puts 'Oops, Principal Amount must be between $100 and $100M!'
    end
    return @amount 
  end  


# strip non-numeric chars except ".", validate range and decimals places, display result 
  def getint(input)          
    intrate = input.to_s.gsub(/[^0-9.]+/, '')
    @interest = DecNum(intrate).round(:places=>3) 
    if @interest.between?(0.125,35.0)
      @output.puts 'The interest Rate you entered is: ' + @interest.to_s
      @status = 'valid'
    else 
      @output.puts 'Oops, Interest Rate must be between 0.125 and 35 percent!'
    end
    return @interest 
  end


# strip non-numeric chars except "." truncate decimals, validate range, display result in integers  
  def getyrs(input) 
    years = input.gsub(/[^0-9.]+/, '')          
    @term_years = years.to_i
    if @term_years.between?(1,99)
      @output.puts 'The term length you entered is: ' + @term_years.to_s + ' years'
      @status = 'valid'
    else
      @output.puts 'Oops, loan length must be between 1 and 99 years!'
    end
    return @term_years 
  end
end