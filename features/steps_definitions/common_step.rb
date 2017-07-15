require 'selenium-webdriver'
require 'rspec/expectations'

Given(/^User launch the application base URL '(.*)' in the browser$/) do |baseURL|
  drivers.get baseURL
end

When(/^I land on application 'Mock' page$/) do
  @mockpage = MockPage.new @driver
  expect(@mockpage.verify_user_land_on_mock_page).to eq(true)
end

Then(/^I should see '(\d+)' numbers of text views on screen$/) do |count|
  expect(@mockpage.verify_user_should_see_list_of_text_views(count)).to eq(true)
end

Then(/^the value appear in text\-fields should be greater than (\d+)$/) do |minimum_value|
  expect(@mockpage.verify_value_in_text_view_greater_than(minimum_value)).to eq(true)
end

Then(/^user should see following values in-order in text views:$/) do |data_table|
  expected_values=[]
  data_table.rows.each do |dt|
    expected_values.push(dt[0].to_s)
  end
  expect(@mockpage.verify_following_values_in_text_views).to eq(expected_values)
end

Then(/^the values appear in text view should be formatted currencies$/) do
  expect(@mockpage.verify_values_formatted_in_currencies).to eq(true)
end

Then(/^the total matches with sum of all the values in all text views$/) do
  expect(@mockpage.verify_sum_of_all_text_views_equals_to_total).to eq(true)
end
