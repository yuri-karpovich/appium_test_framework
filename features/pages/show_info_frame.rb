class ShowInfoFrame
  include Page

  identifier(class: 'android.widget.FrameLayout', enabled: true)
  identifier(id: 'com.battlelancer.seriesguide:id/containerShowInfo', enabled: true)
  identifier(id: 'com.battlelancer.seriesguide:id/buttonPositive', text: 'ADD SHOW')

  element(:add_show_button, id: 'com.battlelancer.seriesguide:id/buttonPositive', text: 'ADD SHOW')
  element(:title, id: 'com.battlelancer.seriesguide:id/textViewAddTitle')
  element(:image, id: 'com.battlelancer.seriesguide:id/imageViewAddPoster')

  def self.show_title
    title_element.text
  end
end