class MainMenu
  include MobilePageObject

  identifier(id: 'com.battlelancer.seriesguide:id/design_navigation_view', enabled: true)
  identifier(id: 'com.battlelancer.seriesguide:id/design_menu_item_text', text: I18n.t('main_menu.shows'))
  identifier(id: 'com.battlelancer.seriesguide:id/design_menu_item_text', text: I18n.t('main_menu.statistics'))
  element(:menu_item, id: 'com.battlelancer.seriesguide:id/design_menu_item_text')

  # Find menu item by its name
  # @return [Selenium::WebDriver::Element]
  def self.menu_item(name)
    menu_item_elements.find { |el| el.text == name }
  end

end