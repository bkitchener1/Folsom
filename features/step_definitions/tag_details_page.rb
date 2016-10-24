Then(/^I am directed to the Tag's Detail Page$/) do
  TagDetailPage.new.tag_detail_header.verify_visible
end

Then(/^The Tag Detail Page Header matches the Tag I clicked on$/) do
  TagDetailPage.new.tag_detail_header.verify_text @tag
end

Then(/^I can see Similar Tags$/) do
  ContentTags.tags_section.verify_visible
end

Given(/^I visit the Tag Detail Page$/) do
  TagDetailPage.open_page
end