class AddShowPage
  include MobilePageObject

  identifier(
    id:      'com.battlelancer.seriesguide:id/textViewTabStripItem',
    text:    I18n.t('add_show_page.add_show_button'),
    enabled: true
  )
  element(:close_get_started_button, id: 'com.battlelancer.seriesguide:id/buttonFirstRunDismiss')
  element(:add_show_button, id: 'com.battlelancer.seriesguide:id/buttonShowsAdd')

  # @return [Array] array of Shows cards
  def self.shows_cards_collection
    driver.find_element(id: 'android:id/list').find_elements(class: 'android.widget.RelativeLayout')
  end

end