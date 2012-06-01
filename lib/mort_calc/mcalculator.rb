require File.expand_path(File.dirname(__FILE__) + "/../../lib/mort_calc/validator")
# require 'flt'

module MortCalc

  class Calculator 
    attr_accessor :user_input, :amount, :interest, :term_years, :monthly_payment
    # include Flt
    include Validator
    extend Validator
    
    def initialize(output)
      @output = output
    end
    
    def run_calc
      @output.puts 'Welcome to the Ruby Mortgage Calculator!'
      @amount = getinput("amount").to_i
      @output.puts @amount
      @interest = getinput("interest").to_i # multiplied by 1000!
      @output.puts @interest 
      @term_years = getinput("term_years").to_i
      @output.puts @term_years
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