@javascript
Feature: Book Inventory

  In orde to be able to keep track of my books
  As a user
  I should be able to keep an inventory of my books

  Background:
    Given I am a registered user
    And I am logged in

  Scenario: Listing books in my Inventory
    Given I have populated my inventory with several books
    When I visit the homepage
    Then I should see the list of my books

  Scenario: Adding a new book to the inventory
    When I submit a new book to my inventory
    Then I should see the new book in my inventory

  Scenario: Changing the name of a book
    Given I have a book in my inventory
    When I change the title of my inventory
    Then I should see the book with the new titile in my inventory

  Scenario: Removing a book from my inventory
    Given I have a book in my inventory
    When I remove a book from my inventory
    Then I should not see it listining in the inventory anymore
