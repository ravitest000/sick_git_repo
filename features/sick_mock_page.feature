Feature: Text View Functionality

Background:
  Given User launch the application base URL 'http://localhost:4567/' in the browser

Scenario: Verify '5' numbers of text view appears on screen
  When I land on application 'Mock' page
  Then I should see '5' numbers of text views on screen

Scenario: Verify value appear in text-fields should be greater than 0
  When I land on application 'Mock' page
  Then the value appear in text-fields should be greater than 0

Scenario: Verify user should see values in text view
  When I land on application 'Mock' page
  Then user should see following values in-order in text views:
  |values|
  |$122,365.24|
  |$599.00|
  |$850,139.99|
  |$23,329.50|
  |$566.27|

Scenario: Verify values appear in text view should be formatted currencies
  When I land on application 'Mock' page
  Then the values appear in text view should be formatted currencies

Scenario: Verify the total matches with sum of all the values in all text views
  When I land on application 'Mock' page
  Then the total matches with sum of all the values in all text views
