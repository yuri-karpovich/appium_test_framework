class StatisticsPage
  include Page

  def self.goto
    driver_wrapper.swipe_from_left
    raise 'Main menu is not displayed' unless MainMenu.displayed?
    MainMenu.menu_item('Statistics').click
  end

  identifier(
    class:   'android.widget.TextView',
    text:    'Statistics',
    enabled: true
  )
  identifier(
    id:      'com.battlelancer.seriesguide:id/labelStatsShows',
    text:    'SHOWS',
    enabled: true
  )

  element(:shows_count, id: 'com.battlelancer.seriesguide:id/textViewStatsShows')
  element(:episodes_count, id: 'com.battlelancer.seriesguide:id/textViewStatsEpisodes')
  element(:watched_episodes_count, id: 'com.battlelancer.seriesguide:id/textViewStatsEpisodesWatched')

  def self.shows_count
    shows_count_element.text.to_i
  end

  def self.episodes_count
    episodes_count_element.text.to_i
  end

  def self.watched_episodes_count
    watched_episodes_count_element.text.split(' ')[0].to_i
  end


end