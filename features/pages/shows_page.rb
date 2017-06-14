class ShowsPage
  include Page

  identifier(
    id:      'com.battlelancer.seriesguide:id/textViewTabStripItem',
    text:    'SHOWS',
    enabled: true
  )
  element(:close_get_started_button, id: 'com.battlelancer.seriesguide:id/buttonFirstRunDismiss')
  element(:add_show_button, id: 'com.battlelancer.seriesguide:id/buttonShowsAdd')
  element(:show_card, id: 'com.battlelancer.seriesguide:id/seriesname')

  def self.goto
    driver_wrapper.swipe_from_left
    raise 'Main menu is not displayed' unless MainMenu.displayed?
    MainMenu.shows_element.click
  end

  def self.my_shows_titles
    show_card_elements.map(&:text)
  end

end