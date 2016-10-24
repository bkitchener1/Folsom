# updated url from 1 to parts
#change was reverted ARW 3949
# southern Europe:
#http://components.arrow.com/part/search/1?region=arrowse

Then(/^I am directed to the Components site with my region "([^"]*)" set$/) do |region_url_value|
 # $driver.verify_url "components.arrow.com/part/search/parts?region=#{region_url_value}"
  $driver.verify_url "components.arrow.com/part/search/1?region=#{region_url_value}"

end

When(/^I press the "([^"]*)" Button in Region Modal$/) do |btn_name_attribute|
  SelectRegion.new.region_btn(btn_name_attribute).verify_visible.click
end
