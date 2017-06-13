class ShowsPage
  include Page

  element(
    :identifier,
    id:      'com.battlelancer.seriesguide:id/textViewTabStripItem',
    text:    'SHOWS',
    enabled: true
  )
  element(:close_get_started_button, id: 'com.battlelancer.seriesguide:id/buttonFirstRunDismiss')
  element(:add_show_button, id: 'com.battlelancer.seriesguide:id/buttonShowsAdd')

end