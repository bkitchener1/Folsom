Given(/^I have searched the Arrow site for Reference Design "(.*?)"$/) do |search_s|
  @search_term = search_s
  search_param = "q=#{@search_term}"
  @srp = ReferenceDesignListingsPage.open_page(:search_param => search_param)

  # puts @srp.page_url_value
end
Given(/^I have searched the Arrow site for Reference Designs$/) do
  @search_term = 'test'
  search_param = "q=#{@search_term}"
  @srp = visit_page(ReferenceDesignListingsPage, :using_params => {:search_param => search_param})
end

And(/^There are Reference Design Search Sort Options$/) do

  expect(SearchResultsPage.new.get_sort_options_text).to match_array ["Relevance", "Date Ascending", "Date Descending", "Released By Ascending", "Released By Descending", "For Application Ascending", "For Application Descending", ]
end

And(/^I find the first Reference Design Search Item$/) do
  @search_result_part         = ReferenceDesignListingsPage.new.reference_designs.first
  @ref_des_name      = @search_result_part.design_name.text
  @manu_name      = @search_result_part.man_name.text
  @ref_des_url_param = @search_result_part.get_description_as_url
end

When(/^I click on the Reference Design Search Item's Title$/) do
  @ref_ds_detail_page = @search_result_part.open_ref_design_detail_page

end

When(/^I click on the Reference Design Search Item's Image$/) do
  @ref_ds_detail_page = @search_result_part.click_on_image

end

And(/^The Reference Design Detail page has the correct URL structure$/) do
  $driver.verify_url "#{$base_url}/reference-designs/#{@ref_des_url_param}/"
end

Then(/^I am directed to the Reference Design Detail page$/) do

end

Then(/^I can see the Description for the Reference Design Search Item$/) do
  ReferenceDesignItem.new.ref_design_desc.verify_visible
end

And(/^I can see the Manufacturer Name for the Reference Design Search Item$/) do
  ReferenceDesignItem.new.man_name.verify_visible
end

And(/^I can see the For Application info for the Reference Design Search Item$/) do
  ReferenceDesignItem.new.for_application.verify_visible
end

And(/^I can see the For End Products info for the Reference Design Search Item$/) do
  ReferenceDesignItem.new.for_end_products.verify_visible
end


When(/^I click on the Released By Manufacturer Name of the Search Item$/) do
  ReferenceDesignItem.new.click_on_released_by_manu_name
end


And(/^I can see an Add To Project Button for the Reference Design Search Item$/) do
  ReferenceDesignItem.save_ref_des_btn.verify_visible
end