Given(/^Tmall application launch$/) do
  @wait.until { (@driver.find_element(:id, 'com.alibaba.aliexpresshd:id/search_hint').displayed?) }

  # Close popup menu if exists
  close_button = nil
  @wait.until do
    begin
      close_button = @driver.find_element(:id, 'closebtn')
    rescue
      nil
    end
  end
  close_button.click if close_button

  left_menu = @driver.id 'com.alibaba.aliexpresshd:id/left_action'
  left_menu.click

  # can also use the alias for find_element(:id, 'resource id') ==> id('resource id')
  settings_entry_point = @wait.until { @driver.text('Settings') }
  settings_entry_point.click

  # get version number
  version_number = @driver.find_element(:id, 'com.alibaba.aliexpresshd:id/tv_version_name').text
  puts version_number
  expect(version_number).to eq '5.3.1'
end