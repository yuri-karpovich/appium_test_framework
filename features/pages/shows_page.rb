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
  element(:show_title, id: 'com.battlelancer.seriesguide:id/seriesname')
  element(:grid, id: 'android:id/list')

  def self.my_shows_titles
    show_title_elements.map(&:text)
  end

  def self.show_with_title(title)
    show_title_elements.find { |s| s.text == title }
  end

  def self.shows_cards(show_title = nil)
    cards = grid_element.find_elements(class: 'android.widget.RelativeLayout')
    return cards unless show_title
    cards.find do |card|
      card.find_element(id: 'com.battlelancer.seriesguide:id/seriesname').text == show_title
    end
  end

  def self.episode_number(show_title)
    shows_cards(show_title).find_element(
      id: 'com.battlelancer.seriesguide:id/TextViewShowListNextEpisode'
    ).text.split(' ')[0].split('x')[1].to_i
  end

end