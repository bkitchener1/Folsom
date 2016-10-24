Given(/^I visit the Webinar Detail Page$/) do
  WebinarDetailPage.open_page
end

Then(/^I can see the Webinar Title$/) do
  WebinarDetailPage.webinar_article_title.verify_visible
end

And(/^I can see Webinar 'add to project' button$/) do
  WebinarDetailPage.webinar_article_save_icon.verify_visible
end

And(/^I can see Webinar article$/) do
  WebinarDetailPage.webinar_detail_text.verify_visible
end

Then(/^I can see Related Webinar$/) do
  WebinarDetailPage.related_webinar_parent.verify_visible
end

And(/^I can see the watch button for the Webinar$/) do
  WebinarDetailPage.watch_later_btn.verify_visible
end

And(/^I can see Related Webinar Name$/) do
  WebinarDetailPage.new.webinar_locations.related_webinar_title.verify_visible
end

And(/^I can see Related Webinar Address$/) do
  WebinarLocation.related_webinar_address.verify_visible
end

And(/^I can see Related Webinar '(.*)' button$/) do |button_type|
  case button_type
    when 'add to calander'
      WebinarLocation.related_webinar_calendar_image.verify_visible
    when 'map'
      WebinarLocation.related_webinar_map_image.verify_visible
  end
end