class StatisticsPage
  include MobilePageObject

  # Navigate to the #StatisticsPage using main menu
  def self.goto
    driver_wrapper.swipe_from_left
    raise 'Main menu is not displayed' unless MainMenu.displayed?
    MainMenu.menu_item(I18n.t('main_menu.statistics')).click
  end

  identifier(
    class:   'android.widget.TextView',
    text:    I18n.t('statistics_page.statistics_text'),
    enabled: true
  )
  identifier(
    id:      'com.battlelancer.seriesguide:id/labelStatsShows',
    text:    I18n.t('statistics_page.shows_text'),
    enabled: true
  )

  element(:shows_count, id: 'com.battlelancer.seriesguide:id/textViewStatsShows')
  element(:episodes_count, id: 'com.battlelancer.seriesguide:id/textViewStatsEpisodes')
  element(:watched_episodes_count, id: 'com.battlelancer.seriesguide:id/textViewStatsEpisodesWatched')

  # @return [Fixnum] count of Shows
  def self.shows_count
    shows_count_element.text.to_i
  end

  # @return [Fixnum] count of episodes
  def self.episodes_count
    episodes_count_element.text.to_i
  end

  # @return [Fixnum] count of watched episodes
  def self.watched_episodes_count
    watched_episodes_count_element.text.split(' ')[0].to_i
  end


end