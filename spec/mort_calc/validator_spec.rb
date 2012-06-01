require 'spec_helper'

module MortCalc
  describe Validator do
    describe "#validator" do
      context "getting amount" do
        # need code here
      end
      context "getting interest" do
        # need code here
      end
      context "getting term years" do
        # need code here
      end
    end
    describe "#getamt" do
      it "sends a prompt for the amount" do
        output.should_receive(:puts).with('Enter principal amount in U.S.dollars:')       
        validator.getamt('300000')
      end      
      it "checks the principal amount range" do
        output.should_receive(:puts).with('Principal Amount is: ' + usdollaramt) #????
        validator.getamt(300000)
      end        
    end   
       
    describe "#getinterest" do
      it "prompts for the annual interest rate" do
        output.should_receive(:puts).with('Enter annual interest rate between 1% and 30% using up to 3 decimals:')
        validator.getinterest(3.875)
      end
      it "checks the interest rate range" do
        output.should_receive(:puts).with('Interest Rate is: ' + intrate) #????
        validator.getamt(3.875)
      end  
    end 
    
    describe "#getyears" do
      it "prompts for the term length in years" do
        output.should_receive(:puts).with('Enter the length of the loan in years:')
        validator.getyears(15)
      end
      it "checks the interest rate range" do
        output.should_receive(:puts).with('The Term Length is: ' + years + ' years') #????
        validator.getyears(15)
      end  
    end     
  end
end