Then(/^I can see the Social Share Bar$/) do
  SocialShareBar.social_share_bar_list.verify_visible
end

And(/^I can use the Social Share bar to search to "([^"]*)" Platforms$/) do |size|
  SocialShareBar.social_share_bar_list_items.verify_count size
end


When(/^I click on the Social Share icon of the Article$/) do
  ArticlePage.share_btn.click
end

Then(/^I can see the Social Share Modal$/) do
  SocialShareModal.share_modal.verify_visible
end


And(/^I can see a Pinterest Share icon$/) do
  SocialShareModal.pinterest.verify_visible
end


And(/^I can see (\d+) social share options$/) do |expected_no_of_share_options|
  SocialShareModal.share_icons.verify_count expected_no_of_share_options
end