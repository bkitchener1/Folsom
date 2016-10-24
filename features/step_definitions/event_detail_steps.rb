Given(/^I visit the Event Detail Page$/) do
  EventDetailPage.open_page
end

Then(/^I can see the event title$/) do
  EventDetailPage.new.event_article_title.verify_visible
end

And(/^I can see the event date$/) do
  EventDetailPage.new.event_article_date.verify_visible
end

And(/^I can see 'add to project' button$/) do
  EventDetailPage.new.event_article_save_icon.verify_visible
end

And(/^I can see 'share' button$/)do
  EventDetailPage.new.event_article_share_icon.verify_visible
end

And(/^I can see event article$/) do
  EventDetailPage.event_detail_text.verify_visible
end

And(/^I can see Event Tags$/) do

  ContentTags.new.tags_section_h3.verify_visible
  ContentTags.new.tags.verify_visible
end

And(/^I click the first tag$/) do
  tag = ContentTags.tags.where(:displayed, true)
  @tag = tag.text

  tag.click
end

Then(/^I can see related event$/) do
  EventDetailPage.related_event_parent.verify_visible
end

And(/^Event Date for each Related event is a future date$/) do
  EventDetailPage.verify_related_events_date_is_a_future_date
end

Then(/^I can see Manufacturer heading$/) do
  EventDetailPage.manufacturer_heading.verify_visible
end

And(/^I can see manufacturer products$/) do
  ResponsiveCarousel.manufacturer_module_responsive_carousel_item.verify_visible
  Manufacturer.manufacture_product_link.verify_attribute "href", "#{$base_url}/products/manufacturers"
end

And(/^I can see pagination link to navigate to next image$/) do
  ResponsiveCarousel.responsive_carousel_pagination.verify_visible
end


And(/^I can see related event name$/) do
  EventLocation.related_event_title.verify_visible
end

And(/^I can see related event date$/) do
  EventLocation.related_event_date.verify_visible
end

And(/^I can see related event address$/) do
  EventLocation.related_event_address.verify_visible
end

And(/^I can see related event 'add to calendar' button$/) do
  EventLocation.related_event_calendar_image.verify_visible

end

And(/^I can see related event 'map' button$/) do
  EventLocation.related_event_map_image.verify_visible
end

And(/^I can see related event 'register' button$/) do
  EventLocation.get_related_event_register_link.verify_visible
end