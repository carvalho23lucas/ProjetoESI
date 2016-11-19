Feature: User can Login
Scenario: Login

Given I am on the login page
When I enter an e-mail address
And I enter a password
Then I should login to the system