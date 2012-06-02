require File.expand_path(File.dirname(__FILE__) + "/../../lib/mort_calc/validator")
require 'flt'

module MortCalc

  class Calculator 
    attr_accessor :user_input, :status, :amount, :interest, :term_years, :monthly_payment
    include Flt
    include Validator
    extend Validator
    
    def initialize(output)
      @output = output
    end
    
    def run_calc
      @output.puts 'Welcome to the Ruby Mortgage Calculator!'
      @amount = DecNum(getinput("amount"))
      @interest = DecNum(getinput("interest"))
      @term_years = getinput("term_years").to_i
      @monthly_payment = calculate_payment(@amount, @interest, @term_years)
      self.finish(@monthly_payment)
    end
  
    def getinput(object_name)
      input_value = ["incoming", nil]
      @output.puts input_value[0]     
      until input_value[0] == "good" 
        input_value = validator(object_name)
        @output.puts input_value.to_s
        if input_value[1] == nil
          self.quit
        end
      end
      return input_value[1]
    end
    
    def calculate_payment(amount, interest, term_years)
      @output.puts 'Calculating...'
    end    
  
    def finish(monthly_payment)
      @output.puts "Your monthly payment is: monthly_payment"
    end 
    
    def quit
      @output.puts "Oops, no value entered...exiting..."
      exit
    end    
    
  end
end