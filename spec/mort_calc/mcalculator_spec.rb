require 'spec_helper'

module MortCalc
  describe Calculator do
    let(:output) { double('output').as_null_object }      
    let(:calculator) { Calculator.new(output) } 
    
    describe "#run_calc" do
      it "sends a welcome message" do
        output.should_receive(:puts).with('Welcome to the Ruby Mortgage Calculator!')       
        calculator.run_calc
      end
    end   
  end
end
