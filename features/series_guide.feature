@appium @android
Feature: Shows management

  Scenario: Add new show to the personal list
    Given I am on the ShowsPage
    And I click close_get_started_button if it's on the screen
    When I click add_show_button element
    Then I am on the AddShowPage
    When I click random movie element from the shows_cards_collection
    Then I see ShowPreviewDialog
    When I click add_show button on the ShowPreviewDialog
    And I go to the ShowsPage via main menu
    Then I see selected show title on the screen



