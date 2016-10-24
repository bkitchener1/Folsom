And(/^The Related Content Sidebar has items$/) do
  Masonry.masonry_items.verify_count_greater_than 0
end

And(/^Each Related Content item has a Play Video icon$/) do
  RelatedContentModule.new.related_articles.where(:displayed,true).each{ |article| article.play_btn.verify_visible}
end

Then(/^the Related Content Module has a disabled Back button$/) do
  RelatedContentModule.new.related_vid_prev.verify_attribute('class', 'slick-disabled')
end

When(/^I click on the Related Content Module's Next Button$/) do
  RelatedContentModule.new.related_vid_next.click
end

Then(/^The Related Content Module's Previous button is enabled$/) do
  RelatedContentModule.new.related_vid_prev.verify_attribute_not('class', 'slick-disabled')
end

And(/^Article "([^"]*)" is no longer present on the Related Content Module$/) do |arg|
  RelatedContentModule.new.related_articles[arg-1].verify_not_visible
end

And(/^Article "([^"]*)" is present on the Related Content Module$/) do |arg|
  RelatedContentModule.new.related_articles[arg-1].verify_visible
end

Then(/^The Related Content Module's Previous button is disabled$/) do
  RelatedContentModule.new.related_vid_prev.verify_attribute('class', 'slick-disabled')
end

When(/^I click on the Related Content Module's Previous Button$/) do
  RelatedContentModule.new.related_vid_prev.click
end

And(/^The first "([^"]*)" Articles are visible on the Related Content Module$/) do |arg|
  for i in 0..arg-1
    RelatedContentModule.new.related_articles[i].verify_visible
  end

end

And(/^The Related Content Module shows "([^"]*)" content slides$/) do |arg|
  RelatedContentModule.new.related_articles.where(:displayed, true).verify_count(arg)
end