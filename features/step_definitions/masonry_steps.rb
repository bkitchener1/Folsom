And(/^Each Section should contain at least "([^"]*)" article or event$/) do |min|
  ResearchEventsPage.new.articles.info_tiles.verify_count_greater_than(min.to_i-1)
  ResearchEventsPage.new.events.info_tiles.verify_count_greater_than(min.to_i-1)
  ResearchEventsPage.new.videos.info_tiles.verify_count_greater_than(min.to_i-1)
end


And(/^I can see "([^"]*)" filterable sections of Content$/) do |size|
  Masonry.filterable_sections.verify_count_greater_than (size.to_i-1)
end

And(/^There are at least one Videos displayed$/) do
  ResearchEventsPage.new.section.info_tiles.each{|tile|tile.play_icon.verify_visible}
end

Then(/^I can see the Related Content Sidebar$/) do
  Masonry.masonry_sections.verify_visible
end

Then(/^I find the Masonry Section$/) do
  Masonry.new.masonry_sections.verify_visible
end

And(/^The Related Content Sidebar has "([^"]*)" items$/) do |arg|
  Masonry.new.masonry_items.verify_count arg
end

And(/^Each Related Content item does NOT have a Play Video icon$/) do
  InformationTile.each{|tile|tile.play_icon.verify_not_visible}
end