Feature: mort-calc starts calculation

	As a user
	I want to start a calculation
	So that I can get a mortgage payment amount
	
	Scenario: start calculation
		Given I am not yet inquiring
		When I start a new calculation
		Then I should see "Welcome to the Ruby Mortgage Calculator!"
		And I should see "Enter principal amount in U.S.dollars:"
