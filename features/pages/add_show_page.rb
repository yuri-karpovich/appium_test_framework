class AddShowPage
  include Page

  identifier(
    id:      'com.battlelancer.seriesguide:id/textViewTabStripItem',
    text:    'ADD SHOW',
    enabled: true
  )
  element(:close_get_started_button, id: 'com.battlelancer.seriesguide:id/buttonFirstRunDismiss')
  element(:add_show_button, id: 'com.battlelancer.seriesguide:id/buttonShowsAdd')

  def self.shows_cards_collection
    driver.find_element(id: 'android:id/list').find_elements(class: 'android.widget.RelativeLayout')
  end

end