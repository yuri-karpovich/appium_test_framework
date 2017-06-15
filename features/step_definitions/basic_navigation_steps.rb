And(/^I am on the (\w+)/) do |page|
  @page = Kernel.const_get(page)
  @page.displayed?
end

And(/^I click (\w+) if it's on the screen$/) do |button|
  @page.send("#{button}_element").click if @page.send("#{button}_element?")
end

When(/^I click (\w+) element$/) do |button|
  @page.send("#{button}_element").click
end

When(/^I click random element from the (\w+)/) do |collection_name|
  @page.send(collection_name).sample.click
end

Then(/^I see the (\w+)/) do |page|
  @page = Kernel.const_get(page)
  @page.displayed?
end

And(/^I go to the (\w+)$/) do |page|
  @page = Kernel.const_get(page)
  @page.goto
end

And(/^I remember (\w+) as '(.*)'$/) do |method_name, key|
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
