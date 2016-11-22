Feature: User can Login
Scenario: Login

    Given I am on the login page
    When I enter an e-mail address
    And I enter a password
    And I click the login button
    Then I should login to the system