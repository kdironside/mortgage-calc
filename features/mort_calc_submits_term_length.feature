Feature: user submits loan term length in years for mortgage calculation

	The user submits the length of the loan between 1 year and 30 years.

	For each calculation, the principal amount, the annual interest rate, and term length, a monthly
	 mortgage payment is calculated and returned.
	
Scenario Outline: submit mortgage length in years
	Given the length of the loan is between "<min_year>" and "<max_year>"
	When I enter a valid mortgage loan term length "<years>"
	Then I should see "Your monthly payment is :" "<monthly_mort_calc_amt>"