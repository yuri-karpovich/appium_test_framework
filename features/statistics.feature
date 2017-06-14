@appium @android
Feature: Statistics functionality

  Background:
    Given I am on the ShowsPage
    And I click close_get_started_button if it's on the screen


  Scenario: Increase Shows Statistics counter
    When I go to the StatisticsPage
    And I remember shows_count on StatisticsPage as 'initial shows number'
    Then I go to the ShowsPage
    And I click add_show_button element
    Then I am on the AddShowPage
    When I click random element from the shows_cards_collection
    Then I see the ShowInfoFrame
    When I click add_show_button element
    Then I am on the AddShowPage
    When I go to the StatisticsPage
    And I remember shows_count on StatisticsPage as 'new shows number'
    Then 'new shows number' should not be '0'
    And 'new shows number' should be bigger than 'initial shows number' by 1


  Scenario: Increase Watched Episodes statistics counter
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
    When I go to the StatisticsPage
    And I remember watched_episodes_count on StatisticsPage as 'initial episodes number'
    Then I go to the ShowsPage
    When I click Show with remembered title 'selected show'
    Then I am on the ShowInfoPage
#    And I remember episode_number on ShowInfoPage as 'season number'
    And I click set_watched_button element
    When I go to the StatisticsPage
    And I remember watched_episodes_count on StatisticsPage as 'new episodes number'
    Then 'new episodes number' should not be '0'
    And 'new episodes number' should be bigger than 'initial episodes number' by 1


