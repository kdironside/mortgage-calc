require File.expand_path(File.dirname(__FILE__) + "/../../lib/mort_calc/validator")
require 'flt'

module MortCalc

  class Calculator 
    attr_accessor :user_input, :status, :amount, :interest, :term_years, :months, :monthly_payment
    include Flt
    include Validator
    extend Validator
    
    def initialize(output)
      @output = output
    end
    
    def run_calc
      @output.puts "\nWelcome to the Ruby Mortgage Calculator!"
      self.getinput("amount")
      self.getinput("interest")
      self.getinput("term_years")
      @monthly_payment = calculate_payment(@amount, @interest, @term_years)
      self.finish(@monthly_payment)
    end
  
    def getinput(object_name) 
      input_value = validator(object_name)                    
      if input_value == nil
        self.quit
      end
      return input_value
    end
    
    # The formula below calculates M, the monthly mortgage payment:
    # M = P [ i(1 + i)n ] / [ (1 + i)n - 1]  where P = prinicpal @amount, 
    #                                              i = @interest per month (compounding period)
    #                                          and n = number of compounding periods (number of @months)
    
    def calculate_payment(amt, int, yrs) 
      @output.puts 'Calculating...........................' 
      int = int / 100 / 12                          # e.g. 5% => .05 / 12 = 0.00416666666667
      months = yrs * 12                             # e.g. 30 yrs => 360 months
      monthly_payment = amt * (int * ((1 + int)**months)) / (((1 + int)**months) - 1)        
    end    
  
    def finish(monthly_payment)
      @output.puts "\nYour monthly payment is: " + " $%.2f per month" % [monthly_payment]
      @output.puts "\nThank you for using the Ruby Mortgage Calculator!" 
    end 
    
    def quit
      @output.puts "Oops, no value entered...exiting...toodles!"
      exit
    end       
  end
end