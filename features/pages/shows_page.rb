class ShowsPage
  include Page

  def self.goto
    driver_wrapper.swipe_from_left
    raise 'Main menu is not displayed' unless MainMenu.displayed?
    MainMenu.menu_item('Shows').click
  end

  identifier(
    id:      'com.battlelancer.seriesguide:id/textViewTabStripItem',
    text:    'SHOWS',
    enabled: true
  )
  element(:close_get_started_button, id: 'com.battlelancer.seriesguide:id/buttonFirstRunDismiss')
  element(:add_show_button, id: 'com.battlelancer.seriesguide:id/buttonShowsAdd')
  element(:show_card, id: 'com.battlelancer.seriesguide:id/seriesname')

  def self.my_shows_titles
    show_card_elements.map(&:text)
  end

  def self.show_with_title(title)
    show_card_elements.find{|s| s.text == title }
  end

end