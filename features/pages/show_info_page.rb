class ShowInfoPage
  include MobilePageObject

  identifier(id: 'com.battlelancer.seriesguide:id/TextViewEpisodeDescription')

  element(
    :set_watched_button,
    id: 'com.battlelancer.seriesguide:id/buttonEpisodeWatched', text: I18n.t('show_info_page.set_watched_button')
  )
  element(:season_episode, id: 'com.battlelancer.seriesguide:id/episodeInfo')

  # @return [String] Name of Show
  def self.show_title
    driver.find_element(id: 'com.battlelancer.seriesguide:id/sgToolbar').find_element(class: 'android.widget.TextView').text
  end

  # Get information about Season and Episode numbers
  # @return [Array<Fixnum>] Season and episode numbers
  def self.season_episode_numbers
    Hash[*season_episode_element.text.split(' ')].values.map(&:to_i)
  end

  # @return [Fixnum] number of episode
  def self.episode_number
    season_episode_numbers[1]
  end

  # @return [Fixnum] number of season
  def self.season_number
    season_episode_numbers[0]
  end

end