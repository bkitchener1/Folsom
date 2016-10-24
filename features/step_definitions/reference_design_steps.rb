And(/^I download a Reference Design$/) do
  ProductListingsPage.new.download_reference_design
end

When(/^I visit the Reference Design page$/) do
  ProductListingsPage.new.search_for_product FigNewton.product_with_reference_design
end

Given(/^I visit the Reference Design Landing Page$/) do
  ReferenceDesignLandingPage.open_page
end

And(/^I am Browsing By Manufacturer$/) do
  ReferenceDesignLandingPage.new.dismiss_cookie_warning
  ReferenceDesignLandingPage.new.safe_click_by_manufacturer_button
  $driver.scroll_top
end

And(/^I am Browsing By Application/) do
  ReferenceDesignLandingPage.new.dismiss_cookie_warning
  ReferenceDesignLandingPage.new.by_application.click
  $driver.scroll_top
end

And(/^I am Browsing By End Product/) do
  ReferenceDesignLandingPage.new.filter_by_end_product
  $driver.scroll_top
end

And(/^I CANNOT see the Applications on the Reference Design Landing Page$/) do
  ReferenceDesignLandingPage.new.application_section.verify_not_visible.verify_attribute_not("class","is-active")
end

And(/^I CANNOT see the Manufacturers on the Reference Design Landing Page$/) do
  ReferenceDesignLandingPage.new.manufacturer_section.verify_not_visible.verify_attribute_not("class","is-active")
end

And(/^I CANNOT see the End Products on the Reference Design Landing Page$/) do
  ReferenceDesignLandingPage.new.end_product_section.verify_not_visible.verify_attribute_not("class","is-active")
end

When(/^I select tab "([^"]*)"$/) do |tab_name|
    WebElement.new("a[data-target='#{tab_name}']").verify_visible.click
end


Then(/^I can see all the Manufacturers starting with "([^"]*)"$/) do |tab_name|
  WebElement.new(link_text: tab_name).verify_attribute('class', 'is-selected')
end

Then(/^I can see all the Manufacturers images starting with "([^"]*)"$/) do |tab_name|
  ReferenceDesignLandingPage.new.result_items.where(:displayed, true).each { |item|
    item.hover
    expect(item.result_name.text).to start_with tab_name
  }
end

Given(/^I visit the Reference Design Detail Page$/) do
  ReferenceDesignDetailPage.open_page({:ref_des_url_param => "#{FigNewton.ref_design_url_param}", :ref_des_id => "#{FigNewton.ref_design_id}"})
end

Then(/^I can see the Associated documents heading$/) do
  ReferenceDesignDetailPage.assoc_doc_heading.verify_visible
end

And(/^I can see the associated documents items$/) do
  ReferenceDesignDetailPage.assoc_doc_item.verify_count_greater_than(0)
end

And(/^I can see the download link for the associated documents item$/) do
  ReferenceDesignDetailPage.first_assoc_doc_download_link.verify_visible
end

Then(/^I can see the End Products heading$/) do
  ReferenceDesignDetailPage.end_products_heading.verify_visible
end

And(/^I can see the End Products items$/) do
  ReferenceDesignDetailPage.end_products_item.verify_visible
end

Then(/^I can see End Products heading in tabbed view$/) do
  ReferenceDesignDetailPage.end_products_parent.verify_visible
end


Given(/^I visit a Reference Design Detail Page$/) do
  ReferenceDesignDetailPage.open_page(:ref_des_url_param => "#{FigNewton.ref_design_url_param}", :ref_des_id => "#{FigNewton.ref_design_id}")
end

Then(/^I can see Cross References Module Heading$/) do
  PartDetailsPage.cross_ref_heading.verify_visible
end


Then(/^I am directed to the Reference Design Listings Page$/) do
  $driver.verify_url "reference-designs"
  $driver.verify_title "Search | Arrow.com"
end

And(/^I click Save to Project Image for the Event$/) do
  EventDetailPage.new.click_save_to_project_image
end

Then(/^I CANNOT see a tab option to filter by Linecards$/) do
  ManufacturersTabs.new.get_manu_tabs_link('Linecards').verify_not_visible
end

Then(/^The Reference Detail Page has a Title$/) do
  ReferenceDesignDetailPage.new.body_title.verify_text "#{FigNewton.ref_design_title}"
end

And(/^The Reference Detail Page has a Sub\-Title$/) do
  ReferenceDesignDetailPage.new.body_sub_title.verify_text "Reference Design using part #{FigNewton.ref_design_sub_title}"
end

And(/^The Browser Page Title is correct for the Reference Design Detail Page$/) do
  $driver.verify_title "#{FigNewton.ref_design_browser_title}"
end

Then(/^The Reference Detail Page has a Key Features section$/) do
  ReferenceDesignDetailPage.new.key_features_title.verify_visible
end

And(/^The Key Features shows at least (\d+) Feature$/) do |size|
  ReferenceDesignDetailPage.key_features_list.verify_count_greater_than size
end

Then(/^The Reference Detail Page has a Description section$/) do
  ReferenceDesignDetailPage.new.description.verify_visible
end