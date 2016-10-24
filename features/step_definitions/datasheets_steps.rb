
Then(/^I can see a message that the Datasheet is not available$/) do
  DatasheetToolbarModule.new.datasheet_toolbar_title.verify_visible

  case $lang
    when 'en'
      DatasheetToolbarModule.new.datasheet_toolbar_title.verify_text FigNewton.no_datasheet_found_en_msg
  end
end

Given(/^I visit the Datasheets Landing Page$/) do
  DatasheetsLandingPage.open_page
end

And(/^I can see Datasheet Promotion Title$/) do
  DatasheetsLandingPage.new.datasheet_promo_header.verify_visible
end

And(/^I can see Datasheet Promotion Text$/) do
  DatasheetsLandingPage.new.datasheet_promo_text.verify_visible
end

And(/^I can see Datasheet Promotion Button$/) do
  DatasheetsLandingPage.new.datasheet_promo_btn.verify_visible
end

Then(/^I can see the Mini Datasheet Viewer$/) do
  DatasheetViewerMini.new.datasheet_mini_viewer_parent.verify_visible
end

And(/^The Mini Datasheet Viewer has a Header$/) do
  DatasheetViewerMini.new.datasheet_mini_viewer_header.verify_visible
end

And(/^The Mini Datasheet Viewer has an Image which is a smaller version of the Datasheet$/) do
  DatasheetViewerMini.new.datasheet_mini_viewer_image.verify_visible
end

And(/^The Mini Datasheet Viewer has a View Button$/) do
  DatasheetViewerMini.new.view_datasheet_from_mini_viewer_btn.verify_visible
end

And(/^The Mini Datasheet Viewer has a Download Button$/) do
  DatasheetViewerMini.new.download_datasheet_from_mini_viewer_btn.verify_visible
end

Then(/^The Mini Datasheet Viewer View Button is correct$/) do
  DatasheetViewerMini.new.view_datasheet_from_mini_viewer_btn.verify_attribute("href",'#partsDetailsDatasheet')
end

Then(/^The Mini Datasheet Viewer Download Button is correct$/) do
  PartDetailsPage.new.verify_datasheet_url_is_correct
end

Then(/^I can see 'Our latest Datasheets' heading$/) do
  DatasheetsLandingPage.new.latest_datasheet_heading.verify_visible
end

Then(/^I can see the Datasheet Viewer$/) do
  DatasheetViewer.new.datasheet_viewer.verify_visible
end

Then(/^I CANNOT see the Datasheet Viewer$/) do
  DatasheetViewer.new.datasheet_viewer.verify_not_visible
end

When(/^I click the "([^"]*)" Chevron of the Datasheet Viewer$/) do |direction|
  case direction
    when 'Right'
      DatasheetViewer.datasheet_viewer_right.click
    when 'Left'
      DatasheetViewer.datasheet_viewer_left.click
  end
end

Then(/^I can see Thumbnails for the Datasheet$/) do
  ThumbnailCarousel.thumbnail_carousel_parent.verify_visible
end

When(/^I click on Datasheet Thumbnail "([^"]*)"$/) do |thumbnail_index|
  ThumbnailCarousel.new.thumbnail_carousel_slides[thumbnail_index-1].click
end

Then(/^I can see Page "([^"]*)" of the Datasheet$/) do |exp_thumbnail_slide|
  DatasheetToolbarModule.new.verify_slide_active(exp_thumbnail_slide)
  DatasheetToolbarModule.datasheet_toolbar_counter_input.verify_value(exp_thumbnail_slide)
end


Then(/^I can see the Datasheet Toolbar$/) do
  DatasheetToolbarModule.new.root.verify_visible
end

And(/^I can see a Calendar Icon in the Datasheet Toolbar$/) do
  DatasheetToolbarModule.new.datasheet_toolbar_events_icon.verify_visible
end

Then(/^The Datasheet Toolbar's Counter visibility is "([^"]*)"$/) do |visibility|
  DatasheetToolbarModule.new.datasheet_toolbar_counter_total.verify_visible
end

And(/^I can see a Add to Favourite Icon in the Datasheet Toolbar$/) do
  DatasheetToolbarModule.new.add_content_btn.verify_visible
end

And(/^I can see a Share Icon in the Datasheet Toolbar$/) do
  DatasheetToolbarModule.new('.DatasheetToolbar').share_content_btn.verify_visible
end

And(/^I can see a Download Button in the Datasheet Toolbar$/) do
  DatasheetToolbarModule.new.download_datasheet_from_toolbar_btn.verify_visible
end

Then(/^The Datasheet Toolbar's Download Button is correct$/) do
  PartDetailsPage.new.verify_header_datasheet_url_is_correct
end



Then(/^I can see a Page Title on the Datasheet Detail Page$/) do
  DatasheetsDetailPage.new.datasheet_title.verify_visible
end

And(/^I can see the number of Datasheet Pages available$/) do
  @datasheet_total = DatasheetToolbarModule.new.datasheet_toolbar_counter_total.text
end

When(/^I enter the last Page number and press Enter$/) do
  DatasheetToolbarModule.new.submit_datasheet_page_no(@datasheet_total)
end


Then(/^I am taken to the last Datasheet page$/) do
  DatasheetToolbarModule.new.verify_last_slide_active()
end

And(/^The Last Datasheet Page is the active thumbnail in the Datasheet Viewer Carousel$/) do
  DatasheetToolbarModule.new.verify_last_slide_active()
end


Then(/^The Total Pages from the Datasheet Toolbar matches the amount of Datasheet Thumbnails$/) do
  DatasheetToolbarModule.new.datasheet_toolbar_counter_total.verify_text ThumbnailCarousel.new.thumbnail_carousel_slides.count
end

Given(/^Visit Datasheets Detail page$/) do
  @datasheet_detail_page = DatasheetsDetailPage.open_page(:datasheet_id => @datasheet_id)
end

Given(/^I visit the Datasheets Detail page$/) do
  @datasheet_detail_page = DatasheetsDetailPage.open_page(:datasheet_id =>  FigNewton.datasheets_id)
  @datasheet_for = FigNewton.datasheet_for
end

Given(/^I visit the Datasheets Detail page for a Datasheet without any related Product Family$/) do
  @datasheet_id  = FigNewton.datasheet_without_family_id
  @datasheet_for = FigNewton.datasheet_without_family_for

  step "Visit Datasheets Detail page"
end

Given(/^I visit the Datasheets Detail page for a Datasheet with LESS than three related Product Families$/) do
  @datasheet_id  = FigNewton.datsheet_with_less_than_three_id
  @datasheet_for = FigNewton.datsheet_with_less_than_three_for

  step "Visit Datasheets Detail page"
end

Given(/^I visit the Datasheets Detail page for a Datasheet with MORE than three related Product Families$/) do
  @datasheet_id  = FigNewton.datsheet_with_more_than_three_id
  @datasheet_for = FigNewton.datsheet_with_more_than_three_for

  step "Visit Datasheets Detail page"
end

Then(/^The Datasheet Detail Page Title displays correctly with an ellipsis "([^"]*)"$/) do |ellipsis_exists|
  # TODO re-factor as this will fail with translations.
  case ellipsis_exists
    when true
      expect(on(DatasheetsDetailPage).datasheet_title).to eq "Datasheet details for #{@datasheet_for}, ..."

    when false
      expect(on(DatasheetsDetailPage).datasheet_title).to eq "Datasheet details for #{@datasheet_for}"

  end
end


Then(/^The Datasheet Detail Page Title displays correctly without an ellipsis$/) do
  DatasheetsDetailPage.new.datasheet_title.verify_text("Datasheet details for #{@datasheet_for}", 30, true)
end

Then(/^The Datasheet Detail Page Title displays correctly with an ellipsis$/) do
  DatasheetsDetailPage.new.datasheet_title.verify_text "Datasheet details for #{@datasheet_for}, ..."
end