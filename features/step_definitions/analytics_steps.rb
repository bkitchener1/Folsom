And(/^The Google Site Verification Meta tag has a Content attribute$/) do
  Analytics.new.google_site_element.verify_attribute('content',"F8uSCIZF13iAcwVhGdsvNl4aJM02l9QJpn_hdM_G9xw")
end

Then(/^The Robots Meta Tag has a noindex,follow Content attribute$/) do
  Analytics.new.robots_meta_tag.verify_attribute('content',"noindex,follow")
end

And(/^There is a Canonical Link$/) do
  Analytics.new.canonical_link.verify_present
end

Then(/^The Google Site Verification Meta tag is present$/) do
  Analytics.new.google_site_element.verify_present
end