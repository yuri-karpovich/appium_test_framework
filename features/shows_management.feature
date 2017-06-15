@appium @android
Feature: Shows management

  Background:
    Given I am on the ShowsPage
    And I click close_get_started_button if it's on the screen

  Scenario: Add new Show to the personal list
    When I click add_show_button element
    Then I am on the AddShowPage
    When I click random element from the shows_cards_collection
    Then I see the ShowInfoFrame
    And I remember show_title as 'My Show'
    When I click add_show_button element
    Then I am on the AddShowPage
    And I go to the ShowsPage
    And I remember my_shows_titles as 'all my shows'
    Then 'all my shows' should include 'My Show'


  Scenario: Last watched episode info update
    When I click add_show_button element
    Then I am on the AddShowPage
    When I click random element from the shows_cards_collection
    Then I see the ShowInfoFrame
    And I remember show_title as 'My Show'
    When I click add_show_button element
    Then I am on the AddShowPage
    And I go to the ShowsPage
    And I remember 'old' episode number of Show with remembered title 'My Show'
    When I click Show with remembered title 'My Show'
    Then I am on the ShowInfoPage
    And I click set_watched_button element
    And I go to the ShowsPage
    And I remember 'new' episode number of Show with remembered title 'My Show'
    And 'new' should be bigger than 'old' by 1
