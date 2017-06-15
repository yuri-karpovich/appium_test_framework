class ShowsPage
  include MobilePageObject

  # Navigate to the #ShowsPage using main menu
  def self.goto
    driver_wrapper.swipe_from_left
    raise 'Main menu is not displayed' unless MainMenu.displayed?
    MainMenu.menu_item(I18n.t('main_menu.shows')).click
  end

  identifier(
    id:      'com.battlelancer.seriesguide:id/textViewTabStripItem',
    text:    I18n.t('shows_page.tab_name'),
    enabled: true
  )

  element(:close_get_started_button, id: 'com.battlelancer.seriesguide:id/buttonFirstRunDismiss')
  element(:add_show_button, id: 'com.battlelancer.seriesguide:id/buttonShowsAdd')
  element(:show_title, id: 'com.battlelancer.seriesguide:id/seriesname')
  element(:grid, id: 'android:id/list')

  # @return [Array<String>] Titles of my shows
  def self.my_shows_titles
    show_title_elements.map(&:text)
  end

  # Find Show by its title
  # @return [Selenium::WebDriver::Element]
  def self.show_with_title(title)
    show_title_elements.find { |s| s.text == title }
  end

  # Find all Shows or a single one with specified title
  # @param [String] show_title Name of show to be found
  # @return [Selenium::WebDriver::Element, Array<Selenium::WebDriver::Element>]
  def self.shows_cards(show_title = nil)
    cards = grid_element.find_elements(class: 'android.widget.RelativeLayout')
    return cards unless show_title
    cards.find do |card|
      card.find_element(id: 'com.battlelancer.seriesguide:id/seriesname').text == show_title
    end
  end

  # Get number of current Show episode
  # @return [Fixnum] number of episode
  def self.episode_number(show_title)
    shows_cards(show_title).find_element(
      id: 'com.battlelancer.seriesguide:id/TextViewShowListNextEpisode'
    ).text.split(' ')[0].split('x')[1].to_i
  end

end