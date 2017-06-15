class ShowInfoFrame
  include MobilePageObject

  identifier(class: 'android.widget.FrameLayout', enabled: true)
  identifier(id: 'com.battlelancer.seriesguide:id/containerShowInfo', enabled: true)
  identifier(id: 'com.battlelancer.seriesguide:id/buttonPositive', text: I18n.t('show_info_frame.add_show_button'))

  element(
    :add_show_button,
    id: 'com.battlelancer.seriesguide:id/buttonPositive', text: I18n.t('show_info_frame.add_show_button')
  )
  element(:title, id: 'com.battlelancer.seriesguide:id/textViewAddTitle')
  element(:image, id: 'com.battlelancer.seriesguide:id/imageViewAddPoster')

  # @return [String] Name of Show
  def self.show_title
    title_element.text
  end
end