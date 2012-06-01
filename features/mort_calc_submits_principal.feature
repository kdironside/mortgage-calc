Feature: user submits U.S. dollar amount for principal

	The user submits an amount between $100 and $100,000,000.

	When a principal amount is entered, the user is then prompted for the interest rate.
	
Scenario Outline: submit principal amount
	Given the principal amount is between "<amt_min>" and "<amt_max>"
	When I enter a valid amount "<usdollaramt>"
	Then I should see "Principal Amount is valid"
	And I should see "Enter annual interest rate between 1% and 30% using up to 3 decimals:"