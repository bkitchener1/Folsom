Then(/^I can see a Datasheets Products Carousel Module$/) do
  @carousel = DatasheetsDetailPage.new.tabbed_responsive_carousel.verify_visible
end

When(/^I view Slide "([^"]*)" of the Carousel$/) do |index|
  @info_square_slide = InformationTile.new(@current_page.get_information_square_slides(@carousel)[index - 1])
end


Then(/^I can see a Title for the Slide$/) do
  InformationTile.new.title.verify_visible
end

Then(/^I can see a Manufacturer for the Slide$/) do
  InformationTile.new.manufacturer.verify_visible
end

# NEW Steps below. Steps above to be refactored/removed safely.
And(/^The Slide Title links to a Product on the Arrow Site$/) do
  InformationTile.new.slide_title_link.verify_attribute("href","#{$base_url}/products")
end


Then(/^The entire Carousel item is linkable$/) do
  Carousel.carousel_slide_as_link.verify_present
end

And(/^The Carousel link matches the first CTA link$/) do
  slide_btn  = Carousel.new.carousel_slide_button_link

  Carousel.new.carousel_slide_button.verify_attribute("href", slide_btn)
end

Then(/^The Carousels linkable area matches the dimensions of the Slide$/) do
  slide_link_size = Carousel.new.carousel_slide_as_link.size
  slide_size      = Carousel.new.carousel_slide.size

  expect(slide_link_size).to eq slide_size
end

Then(/^Each Related Article displays with a Title$/) do
  Masonry.new.info_tiles.each { |tile|
    tile.title.verify_visible
  }
end

And(/^Each Related Article displays with Tags$/) do
  Masonry.new.info_tiles.each { |tile|
    tile.tags.verify_count_greater_than 0
  }
end

And(/^Each Related Article displays with Creation Date$/) do
  Masonry.new.info_tiles.each { |tile|
    tile.creation_date.verify_text " ago"
  }
end