Feature: user submits annual interest amount for mortgage calculation

	The user submits an annual interest rate between 1% and 30% with up to 3 decimals.

	when an annual interest rate is entered, the user is then prompted for the loan length in years.
	
Scenario Outline: submit annual interest amount
	Given the annual interest amount is between "<min_int>" and "<max_int>"
	When I enter a valid interest rate "<annual_interest>"
	Then I should see "Enter the length of the loan between 1  year and 30 years:"