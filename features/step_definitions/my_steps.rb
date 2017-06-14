Given(/^Android emulator started$/) do
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

And(/^I am on the (.*)/) do |page|
  @page = Kernel.const_get(page)
  @page.displayed?
end

And(/^I click (.*) if it's on the screen$/) do |button|
  @page.send("#{button}_element").click if @page.send("#{button}_element?")
end

When(/^I click (.*) element$/) do |button|
  @page.send("#{button}_element").click
end

When(/^I click random element from the (.*)/) do |collection_name|
  @page.send(collection_name).sample.click
end

Then(/^I see the (.*)/) do |page|
  @page = Kernel.const_get(page)
  @page.displayed?
end

And(/^I go to the (.*)$/) do |page|
  @page = Kernel.const_get(page)
  @page.goto
end

And(/^I remember (.*) on (.*) as '(.*)'$/) do |method_name, page_name, key|
  @page            = Kernel.const_get(page_name)
  @remembered[key] = @page.send(method_name)
end

Then(/^'(.*)' should include '(.*)'$/) do |attr1, attr2|
  expect(@remembered[attr1]).to include(@remembered[attr2])
end

Then(/^'(.*)' should be bigger than '(.*)' by (\d+)$/) do |attr1, attr2, diff|
  expect(@remembered[attr1].to_i).to eq(@remembered[attr2].to_i + 1)
end

Then(/^'(.*)' should not be (.*)$/) do |attr1, value|
  expect(@remembered[attr1]).not_to eq(value)

end

When(/^I click Show with remembered title '(.*)'$/) do |text|
  text_locator = @remembered[text]
  ShowsPage.show_with_title(text_locator).click
end

And(/^I remember episode number of Show with remembered title '(.*)' as '(.*)'$/) do |text, key|
  text_locator = @remembered[text]
  @remembered[key] = ShowsPage.episode_number(text_locator)
end