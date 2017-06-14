class ShowInfoPage
  include Page

  identifier(id: 'com.battlelancer.seriesguide:id/TextViewEpisodeDescription')

  element(:set_watched_button, id: 'com.battlelancer.seriesguide:id/buttonEpisodeWatched', text: 'Set watched')
  element(:season_episode, id: 'com.battlelancer.seriesguide:id/episodeInfo')

  def self.show_title
    driver.find_element(id: 'com.battlelancer.seriesguide:id/sgToolbar').find_element(class: 'android.widget.TextView').text
  end

  def self.season_episode_numbers
    Hash[*season_episode_element.text.split(' ')].values.map(&:to_i)
  end

  def self.episode_number
    season_episode_numbers[1]
  end

  def self.season_number
    season_episode_numbers[0]
  end

end