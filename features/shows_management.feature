@appium @android
Feature: Shows management
  As an application user
  I want to save some shows to my personal list
  In order to track information about them

  Background:
    Given I am on the ShowsPage
    And I click close_get_started_button if it's on the screen

  Scenario: Add new Show to the personal list
    When I click add_show_button element
    Then I am on the AddShowPage
    When I click random element from the shows_cards_collection
    Then I see the ShowInfoFrame
    And I remember show_title on ShowInfoFrame as 'selected show'
    When I click add_show_button element
    Then I am on the AddShowPage
    And I go to the ShowsPage
    And I remember my_shows_titles on ShowsPage as 'all my shows'
    Then 'all my shows' should include 'selected show'
