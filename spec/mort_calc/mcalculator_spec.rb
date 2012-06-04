require 'spec_helper'
require 'flt'

module MortCalc
  include Flt
  
  describe Calculator do
    let(:output) { double('output').as_null_object }      
    let(:calculator) { Calculator.new(output) } 
    
    describe "#run_calc" do
      it "sends a start up welcome message" do
        output.should_receive(:puts).with("Welcome to the Ruby Mortgage Calculator!")       
        calculator.run_calc
      end  
      
      it "should get the principal amount" do
        @amount.should == DecNum(getinput("amount"))      
      end
      
      it "should get the interest rate as a percent with 3 decimals" do
        @interest.should == DecNum("5.125")      
      end
      
      it "should get the loan term length in years" do
        @term_years.should == DecNum("15")
      end

    end   
  end
end
