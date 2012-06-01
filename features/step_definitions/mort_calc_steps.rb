class Output
  def messages
    @messages ||= []
  end 
  
  def puts(message)
    messages << message
  end
end

def output
  @output ||= Output.new
end


Given /^I am not yet inquiring$/ do
end
  
When /^I start a new calculation$/ do 
  calculation = MortCalc::Calculation.new(output)
  calculation.start('100','100000000')
end

Then /^I should see "([^"]*)"$/ do |message|
  output.messages.should include(message)
end


# -----------submits principal
Given /^the principal amount range is between "([^"]*)"$/ do |amt_min, amt_max|
  @calculator = MortCalc::Calulator.new(output)
  @calculator.start(amt_min, amt_max)
end

When /^I enter the amount "([^"]*)"$/ do |usdollaramt|
  @calculator.getamt(usdollaramt)
end

Then /^the prompt for interest rate should appear "([^"]*)"$/ do |message|
  output.messages.should include(message)
end












# ----------submits interest rate
Given /^interest rate range is "([^"]*)"$/ do |arg1|
  pending # the code you wish you had
end

When /^I enter the interest rate "([^"]*)"$/ do |arg1|
  pending # the code you wish you had
end

Then /^The prompt for term length should appear "([^"]*)"$/ do |arg1|
  pending # the code you wish you had
end

# -----------submits term length in years
Given /^The term length range is "([^"]*)"$/ do |arg1|
  pending # the code you wish you had
end

When /^I enter the term length "([^"]*)"$/ do |arg1|
  pending # the code you wish you had
end

Then /^the mortgage calculation is displayed "([^"]*)"$/ do |arg1|
  pending # the code you wish you had
end
