When(/^I click Show with remembered title '(.*)'$/) do |text|
  text_locator = @remembered[text]
  ShowsPage.show_with_title(text_locator).click
end

And(/^I remember '(.*)' episode number of Show with remembered title '(.*)'$/) do |key, text|
  text_locator = @remembered[text]
  @remembered[key] = ShowsPage.episode_number(text_locator)
  puts @remembered
end