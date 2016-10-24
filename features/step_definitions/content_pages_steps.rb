Then(/^I can see a Sitemap Page Title$/) do
  ContentPage.sitemap_page_title.verify_visible
end

And(/^I can see at least "([^"]*)" h2 Link$/) do |min|
  ContentPage.h2_links.verify_count_greater_than min
  ContentPage.h2_links.verify_visible
end

And(/^I can see at least "([^"]*)" h3 Link$/) do |min|
  ContentPage.h3_links.verify_visible
  ContentPage.h3_links.verify_count_greater_than min
end

And(/^I can see at least "([^"]*)" Product Link in the First Sub Category Section$/) do |min|
  ContentPage.new.first_sub_category_links.verify_count_greater_than min
end

Then(/^The Content Tags links conform$/) do
  ContentTags.tags.where(:displayed, true).each do |tag|
    tag.verify_attribute('href',"#{$base_url}/tags/")
  end
end