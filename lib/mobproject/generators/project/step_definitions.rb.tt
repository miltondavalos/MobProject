Given(/^Application is up and running$/) do
  sleep 10
end

Then(/^I take a screenshot and save it to ~\/Screenshots$/) do
  save_screenshot_locally("MobTest_#{ENV['PLATFORM']}", @driver)
end