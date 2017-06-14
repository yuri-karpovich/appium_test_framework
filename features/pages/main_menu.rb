class MainMenu
  include Page

  identifier(
    id: 'com.battlelancer.seriesguide:id/design_navigation_view',
    enabled: true
  )

  element(:shows, id: 'com.battlelancer.seriesguide:id/design_menu_item_text', text: 'Shows')

end