class MainMenu
  include Page

  identifier(id: 'com.battlelancer.seriesguide:id/design_navigation_view', enabled: true)
  identifier(id: 'com.battlelancer.seriesguide:id/design_menu_item_text', text: 'Shows')
  identifier(id: 'com.battlelancer.seriesguide:id/design_menu_item_text', text: 'Statistics')
  element(:menu_item, id: 'com.battlelancer.seriesguide:id/design_menu_item_text')

  def self.menu_item(name)
    menu_item_elements.find { |el| el.text == name }
  end

end