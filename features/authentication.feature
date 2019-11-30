Feature: Authentication

  In order to used the website
  As a user
  I should be able to sign up, lo in and log out

Scenario: Signing up
  Given I visit the homepage
  When I fill in the sign up form
  And I confirm the email
  Then Should see that my account is confirmed

Scenario: User Logs in
  Given I am a registered user
  And I visit the homepage
  When I fill in the loggin form
  Then I should be logged in

Scenario: User Logs out
  Given I am a registered user
  And I am logged in
  When I click on the log out button
  Then I should be redirected to the log in page
