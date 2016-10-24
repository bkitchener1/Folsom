
Given(/^I visit a Part Detail Page$/) do
  @api = SearchAjax.new
  @api.search_bav99
  @item = @api.get_in_stock_items.first
  @part_sku =  @item['sourcePartId']
  @part_url = @item['partUrl']
  @manu_name = @item['manufacturer']

  PartDetailsPage.open_page :part_url => @part_url.sub('/en/','')
end

Given(/^I visit a Part Detail with Related Reference Designs$/) do
  @part_sku  = "#{FigNewton.part_with_related_ref_des_sku}"
  @manu_name = "#{FigNewton.part_with_related_ref_des_manu}"
  @part_url  = "#{FigNewton.part_with_related_ref_des_url}"

  PartDetailsPage.open_page :part_url => @part_url
end

Given(/^I visit a Part Detail with Multiple Cart Options$/) do
  @api = SearchAjax.new
  @api.search_bav99
  @item = @api.get_in_stock_items.first
  @part_sku =  @item['sourcePartId']
  @part_url = @item['partUrl']
  @manu_name = @item['manufacturer']

  PartDetailsPage.open_page :part_url => @part_url.sub('/en/','')
end

Given(/^I visit a Part Detail with Back Order option$/) do
  @api = SearchAjax.new
  @api.search_bav99
  @item = @api.get_backordered_items.first
  @part_sku =  @item['partNumber']
  @part_url = @item['partUrl']
  @manu_name = @item['manufacturer']
  PartDetailsPage.open_page :part_url => @part_url.sub('/en/','')
end

Given(/^I visit a Part Detail with Quote$/) do
  @api = SearchAjax.new
  @api.search_for ("7703404xa")
  @item = @api.get_quote_items.first
  $item = @item
  @part_sku =  @item['partNumber']
  @part_url = @item['partUrl']
  @manu_name = @item['manufacturer']
  PartDetailsPage.open_page :part_url => @part_url.sub('/en/','')
end


Given(/^I visit a Part Detail with Ecliptek$/) do
  @api = SearchAjax.new
  @ecliptek_item = @api.search_for('ecliptek').get_ecliptek_items.first
  @part_sku =  @ecliptek_item['sourcePartId']
  @part_url = @ecliptek_item['partUrl']
  @manu_name = @ecliptek_item['manufacturer']

  PartDetailsPage.open_page :part_url => @part_url.sub('/en/','')
end
Given(/^I visit a Part Detail with Pipeline$/) do
  @api = SearchAjax.new
  @api.search_bav99
  @item = @api.get_pipeline_items.first
  @part_sku =  @item['partNumber']
  @part_url = @item['partUrl']
  @manu_name = @item['manufacturer']

  PartDetailsPage.open_page :part_url => @part_url.sub('/en/','')
end

Given(/^I visit a Part Detail with Datasheets$/) do
  @api = SearchAjax.new
  @api.search_bav99
  @item = @api.get_item_with_datasheet.first
  @part_sku =  @item['partNumber']
  @part_url = @item['partUrl']
  @manu_name = @item['manufacturer']

  PartDetailsPage.open_page :part_url => @part_url.sub('/en/','')
end
Given(/^I visit a Part Detail with NO Datasheet$/) do
  @api = SearchAjax.new
  @api.search_bav99
  @item = @api.get_item_with_no_datasheet.first
  @part_sku =  @item['partNumber']
  @part_url = @item['partUrl']
  @manu_name = @item['manufacturer']

  PartDetailsPage.open_page :part_url => @part_url.sub('/en/','')
end

Given(/^I visit a Discontinued Part Detail$/) do
  @api = SearchAjax.new
  @api.search_for("discontinued")
  @item = @api.get_discontinued_items.first
  @part_sku =  @item['partNumber']
  @part_url = @item['partUrl']
  @manu_name = @item['manufacturer']

  PartDetailsPage.open_page :part_url => @part_url.sub('/en/','')
end

Given(/^I visit a Part Detail with Cross References$/) do
  @part_sku  = "#{FigNewton.part_with_cross_references_sku}"
  @manu_name = "#{FigNewton.part_with_cross_references_manu}"
  @part_url  = "#{FigNewton.part_with_cross_references_url}"

  PartDetailsPage.open_page :part_url => @part_url
end


Given(/^I visit a Part Detail with Envision Link$/) do
  @part_sku  = "#{FigNewton.part_with_envision_sku}"
  @manu_name = "#{FigNewton.part_with_envision_manu}"
  @part_url  = "#{FigNewton.part_with_envision_url}"

  PartDetailsPage.open_page :part_url => @part_url
end

When(/^I download a datasheet$/) do
  PartDetailsPage.new.download_datasheet
end

Then(/^I am asked to complete a CAPTCHA$/) do
  CaptchaPopup.new.verify_captcha_triggered
end


And(/^It contains a Back Order link to a 3rd party site$/) do
  page = ProductItem.new
  page.back_order_btn.verify_attribute("href",@item['manufacturer'].gsub(' ', '+'))
end

And(/^It contains a Quote link to a 3rd party site$/) do
  page =  ProductListingsPage.new.product_items.select{|item|item.quote_btn.displayed?}.first
  page.highlight(-1, "purple")
  page.quote_btn.verify_attribute("href",page.part_sku.text)
  page.quote_btn.verify_attribute("href",page.part_manu.text.gsub( ' ', '+'))
end


And(/^It contains a Verical link to a 3rd party site$/) do
  page = ProductItem.new
  page.verical_btn.verify_attribute("href","https://www.verical.com/pd/")
  page.verical_btn.verify_attribute("href","-#{page.part_sku.text}-")
end

And(/^It contains a Ecliptek link to a 3rd party site$/) do
  page = ProductItem.new
  page.ecliptek_quote_btn.verify_attribute("href",page.part_sku.text.gsub(' ', '+'))
end

And(/^The Part has the correct Parts Page Url$/) do

 # adding url to the partsku as the validation is for href below
 #https://hkg.arrow.com/en/products/bav99/fairchild-semiconductor

  part_sku  = ProductItem.new.part_sku.text.downcase
  part_manu = ProductItem.new.part_manu.text.downcase.gsub ' ', '-'
  part_sku_url = "#{FigNewton.base_url}"+"/en/products/"+"#{part_sku}"+"/"+"#{part_manu}"
  ProductItem.new.more_prices.verify_attribute('href',part_sku_url)
  ProductItem.new.more_prices.verify_attribute('href',part_manu)
end

And(/^The Part Page Title matches the Search Result Item I clicked on$/) do
  PartDetailsPage.new.part_summary.verify_text(@part_sku)
end

And(/^The Part Page Manufacturer matches the Search Result Item I clicked on$/) do
  PartDetailsPage.new.manufacturer.verify_text @part_manu
end
Then(/^I can see a Manufacturer on the Product Detail Page$/) do
  PartDetailsPage.new.manufacturer.verify_visible
end
And(/^I can see a Product Category on the Product Detail Page$/) do
  PartDetailsPage.new.product_cat.verify_visible
end
And(/^I can see a Description on the Product Detail Page$/) do
  PartDetailsPage.new.description.verify_visible
end
And(/^I can see 5 Rating Stars on the PDP$/) do
  PartDetailsPage.new.rating_stars.verify_size(5)
  PartsDetailsPage.new.rating_stars.each do |rating_star|
    rating_star.verify_visible
  end
end
And(/^I can see a Share Button on the PDP$/) do
  PartDetailsPage.new.share_btn.verify_visible
end
And(/^I can see a Add Content on the Product Detail Page$/) do
  PartDetailsPage.new.add_content_btn.verify_visible
end


Then(/^I am directed to the Part Page$/) do
  $driver.verify_url "/products"
end

And(/^I see the first buying option$/) do
  PartDetailsPage.new.buying_options.first.verify_present(10)
end

When(/^I Enter a Quantity of "([^"]*)" for the Buy Option$/) do |qty|
  PartDetailsPage.new.buying_options.first.qty.send_keys qty
end

When(/^I Enter the Minimum Quantity for the Buy Option$/) do
  @qty = PartDetailsPage.buying_options.first.get_min_amount
  @stock_price = PartDetailsPage.buying_options.first.get_stock_price
  step %Q"I Enter a Quantity of \"#@qty\" for the Buy Option"
end

And(/^The Buy Option has the Total Price with the relevant Price$/) do
  total = (@qty.to_f*@stock_price.to_f).round(2)
  PartDetailsPage.new.buying_options.first.total_price.verify_text total
end

When(/^I Enter a Quantity that is less than the Minimum of the Buy option$/) do
  PartDetailsPage.new.buying_options.first.set_qty_to_less_than_min
end

When(/^I Enter a Quantity that is more than the Maximum of the Buy Option$/) do
  PartDetailsPage.new.buying_options.first.set_qty_to_more_than_max
end

And(/^I click to Buy for the Buy Option$/) do
  PartDetailsPage.new.buying_options.first.buy_btn.click
end

Then(/^The Quantity Confirmation Pop up displays$/) do
  BuyPartModalModule.new.qty_confirmation_popup.verify_visible
end

Then(/^I can see the Part's Stock Count$/) do
  PartDetailsPage.new.buying_options.first.stock_count.verify_visible
end

And(/^The Stock Level for the Buying Option is more than zero$/) do
  PartDetailsPage.new.buying_options.first.stock_count.verify_text_not("0",30,true)
end

Then(/^The Stock Level for the Buying Option should NOT be displayed$/) do
  PartDetailsPage.new.buying_options.first.stock_count.verify_not_visible
end

And(/^I can see the Get By Text$/) do
  PartDetailsPage.new.buying_options.first.get_by_text.verify_visible
end

And(/^I can see the Contact information$/) do
  BuyingOption.contact_text.verify_visible
end

And(/^I CANNOT see the Stock Status Text$/) do
  PartDetailsPage.new.buying_options.first.stock_status.verify_not_visible
end

And(/^I CANNOT see the Get By Text$/) do
  PartDetailsPage.new.buying_options.first.get_by_text.verify_not_visible
end


And(/^I visit a Part with 'get\-by' information$/) do
  ProductListingsPage.new.search_for_product FigNewton.part_with_lead_time_sku
end

Then(/^I can see the new format for the expected delivery time$/) do
  expect(ProductListingsPage.new.product_listing_text_is_new_format?).to be_truthy
end

Then(/^I can see the old format for the expected delivery time$/) do
  expect(ProductListingsPage.new.product_listing_is_old_format?).to be_truthy
end


Given(/^I visit a Part Category Landing Page$/) do
  PartsCatLandingPage.open_page
end

Then(/^I can see a Part Title$/) do
  PartsCatLandingPage.new.part_title.verify_visible
end

And(/^I can see a Part Description$/) do
  PartsCatLandingPage.new.part_main_description.verify_visible
end


When(/^I click a Sub Product Category from Product Category Page$/) do
  PartsCatLandingPage.new.click_link_for_prod_sub_category
end

When(/^I click a Product Line link from Product Category Page$/) do
  PartsCatLandingPage.new.click_link_for_prod_line_page
end

When(/^I click on the Manufacturer Name on the Part Detail Page$/) do
  PartDetailsPage.new.open_manufacturer_page
end

Then(/^I can see a list of Specifications$/) do
  PartDetailsPage.new.specifications.verify_count_greater_than 1
end

And(/^I can see the Stock Status Text$/) do
  BuyingOption.stock_status.verify_visible
end

And(/^I CANNOT see the Contact information$/) do
  BuyingOption.contact_text.verify_not_visible
end

And(/^the Part Detail page contains a Back Order link to a 3rd party site$/) do
  BuyingOption.back_order_btn.verify_visible
end
#============================================================================================
And(/^I click the Back Order button$/) do
  BuyingOption.back_order_btn.click
end

Then(/^I can see the BAV99_D87Z Back Order Form appear$/) do
  BuyingOption.back_order_modal
end

And(/^I verify content fields$/) do
  BuyingOption.verify_form_fields
end
#============================================================================================
Then(/^I can see a Discontinued Notification$/) do
  BuyingOption.new.discontinued_section.verify_visible
end

Then(/^I can see a Ecliptek section$/) do
  BuyingOption.ecliptek_section.verify_visible
  @ecliptek_part_url = PartDetailsPage.new.buying_options.first.ecliptek_url
end


And(/^the Part Detail page contains a Ecliptek link to a 3rd party site$/) do
  item = @ecliptek_item
  PartDetailsPage.new.buying_options.first.ecliptek_btn.verify_attribute("href",item['sourcePartId'].gsub(" ","+"))
end

Then(/^I can see a Pipeline Link on the Part Detail Page$/) do
  BuyingOption.new.pipeline_link.verify_visible
end

When(/^I click on the Pipeline Link on the Part Detail Page$/) do
  BuyingOption.new.pipeline_link.click
end

Then(/^I can see a Tooltip with detailed Pipeline information$/) do
  TooltipModule.new.tooltip_container.verify_present
  TooltipModule.new.pipeline_details.verify_visible
end

Then(/^I cannot see the Tooltip$/) do
  TooltipModule.new.tooltip_container.verify_not_visible
end

When(/^I close the Tooltip$/) do
  TooltipModule.new.close_tooltip
end

Then(/^I can see a Quote section$/) do
  BuyingOption.quote_section.verify_visible
end

And(/^the Part Detail page contains a Quote link to a 3rd party site$/) do
  BuyingOption.quote_btn.verify_attribute("href", @part_sku.gsub('+', '%2b').gsub(",",""))
  BuyingOption.quote_btn.verify_attribute("href", @manu_name.gsub(' ', '+'))
end

When(/^I click on Product amongst the Product Categories$/) do
  # @prod = @current_page.prod_cats_elements[0]
  @prod_cats = ProductCategory.new.prod_cats
  @prod_cats[2].click
end

Then(/^The Product Category expands$/) do
  Product.new.prod_selector_btn.verify_visible
end

And(/^There are Sub\-Products listed$/) do
  Product.sub_prods.verify_count_greater_than 1
end

Then(/^Each Sub\-Category link is a child of the Parent Product Category$/) do
  Product.new.sub_prods.where(:displayed, true).each { |link|
    cat_name = convert_to_sitecore_url_format(ProductCategory.new.mobile_prod_category_title.text)
  link.verify_attribute("href","#{$base_url}/products/#{cat_name}")
  }
end

Then(/^I can see Featured Manufacture module$/) do
  FeaturedManufacturerPagePart.manufacturer_module.verify_visible
end


And(/^I can see Featured Manufacture Image$/) do
  FeaturedManufacturerPagePart.manufacturer_image.verify_visible
end

And(/^I verify the Featured manufacturer link$/) do
  FeaturedManufacturerPagePart.manufacturer_link.verify_visible
  FeaturedManufacturerPagePart.manufacturer_link.verify_attribute('href', 'products/manufacturers')
end


And(/^I can navigate to the featured manufacturer$/) do
  FeaturedManufacturerPagePart.link_to_first_manufacturer.verify_visible.click
  $driver.verify_url('manufacturers')
end


And(/^I visit the Part Detail Page for a back ordered item$/) do
  @api = SearchAjax.new
  @api.search_bav99
  items = @api.get_backordered_items
  @backordered_item = items.first

  PartDetailsPage.open_page :part_url => @backordered_item['partUrl'].sub('/en/','')
end

And(/^I visit the Part Detail Page$/) do
  @api = SearchAjax.new
  @api.search_bav99
  items = @api.get_backordered_items
  @backordered_item = items.first

  PartDetailsPage.open_page :part_url => @backordered_item['partUrl'].sub('/en/','')
end

And(/^I can see the product category title$/) do
  Product.prod_category_title.verify_visible
end

And(/^I can see the product selector button$/) do
  Product.prod_selector_btn.verify_visible
end

And(/^I can see the product counter$/) do
  Product.prod_cat_counter.verify_visible
end

Then(/^I can see product category overlay$/) do
  ProductCategory.product_overlay.verify_visible
end

And(/^There are Sub\-Products listed in overlay$/) do
  ProductCategory.mobile_sub_prods.verify_visible
end

And(/^I can see the product category title in overlay$/) do
  ProductCategory.mobile_prod_category_title.verify_visible
end

And(/^I can see the product selector button in overlay$/) do
  ProductCategory.prod_selector_btn.verify_visible
end

And(/^I can see the product counter in overlay$/) do
  ProductCategory.mobile_prod_cat_counter.verify_visible
end

When(/^I close the overlay$/) do
  ProductCategory.product_overlay_close.click
end

Then(/^I cannot see product category overlay$/) do
  ProductCategory.product_overlay.verify_not_visible
end

When(/^I click an product category$/) do
  ProductCategory.prod_cats.click
end

And(/^I can see a Product Selector$/) do
  ProductCategory.prod_selector_btn.verify_visible
end

  When(/^I click an Product Category Product Selector button$/) do
    Product.new.click_prod_selector_button
  end

Then(/^I can see product category listed on the basis of product count$/) do
  product_count        = ProductCategory.new.get_product_count_of_all_product_category
  # The List sorted, and reversed should be the same as the the list that was found on the page.
  product_count_sorted = product_count.sort.reverse

  expect(product_count).to eq product_count_sorted
end

When(/^I Enter a Quantity that is less than the Minimum for the Search Item$/) do
  @qty = @qty - 1
  step %Q"I Enter a Quantity of \"#@qty\" for the Search Item"
end

When(/^I Enter a Quantity that is more than the Maximum for the Search Item$/) do
  max = @max + 1
  step %Q"I Enter a Quantity of \"#{max}\" for the Search Item"
end


Then(/^I can see Design With Envision icon$/) do
  PartDetailsPage.new.design_with_envision_icon.verify_visible
end

And(/^I can see Design with Envision link$/) do
  PartDetailsPage.design_with_envision_link.verify_visible
end

And(/^Envision button links to the product in Envision$/) do
  PartDetailsPage.design_with_envision_link.verify_attribute("href","parts=#{@part_sku}&manufacturer=#{URI::encode(@manu_name)}")
end


Then(/^I can see the Part Category Stats on the Right$/) do
  PartsCatLandingPage.new.parent_container.verify_attribute_not('class', 'slick-initialized slick-slider')
end

Then(/^I can see the Part Category Stats below the main content$/) do
  PartsCatLandingPage.new.part_cat_stats.verify_visible
end

And(/^I CANNOT see the Part Category Stats below the main content$/) do
  PartsCatLandingPage.new.parent_container.verify_attribute_not('class', 'slick-initialized slick-slider')
end

And(/^I CANNOT see the Part Category Stats on the Right$/) do
  PartsCatLandingPage.new.parent_container.verify_attribute('class', 'slick-initialized slick-slider')
end


And(/^I am directed to a Sub Part Category Page$/) do
  $driver.verify_url(PartsCatLandingPage.new.page_url)
end

When(/^I access a page containing content imported by the dev kit$/) do
  PartDetailsPage.open_page({:part_url => FigNewton.part_with_dev_kit_import_sku})
end


Then(/^I see the content displayed$/) do
  ImportedWithDevKit.new.imported_from_devkit_indicator.verify_visible
end

And(/^I can see a button that directs to the Product Detail Page$/) do
  Product.prod_selector_btn.verify_visible
  Product.prod_selector_btn.verify_attribute('href', "#{$base_url}/products/search?cat=")
end