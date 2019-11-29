Feature: Authentication

  In order to used the website
  As a user
  I should be able to sign up, lo in and log out

Scenario: Signing up
  Given I visit the homepage
  When I fill in the sign up form
  And I confirm the email
  Then Should see that my account is confirmed
