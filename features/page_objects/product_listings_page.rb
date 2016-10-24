class ProductItem < PageObject

  attr_accessor :item_elem,:part_sku,:part_manu,:part_manu_href

  @product_name = WebElement.new(:class => 'SearchResults-productLink' )
  @part_sku = WebElement.new("span",@product_name)
  @part_manu = WebElement.new(:class => 'SearchResults-productManufacturer' )
  @prod_type = WebElement.new(:class => 'SearchResults-column--type' )
  @stock_available = WebElement.new(:class => 'SearchResults-stock' )
  @stock_column_text = WebElement.new('td.SearchResults-column--stock' )
  @more_prices = WebElement.new(:class => 'SearchResults-morePrices' )
  @buy_btn = WebElement.new(:class => 'ProductPurchase-buy' )
  @view_btn = WebElement.new(:link_text => 'VIEW')
  @back_order_btn = WebElement.new(:class => 'ProductPurchase-button--backOrder' )
  @ecliptek_quote_btn = WebElement.new(:class => 'ProductPurchase-button--ecliptek' )
  @quote_btn = WebElement.new('[href*=part-quote]' )
  @verical_btn = WebElement.new(:class => 'ProductPurchase-button--verical' )
  @product_form = WebElement.new(:class => 'SearchResults-form' )
  @qty = WebElement.new(:class => 'SearchResults-quantity' )
  @total_price = WebElement.new(:class => 'SearchResults-totalPrice' )
  @price_tiers = WebElement.new(:css => 'dl.ProductPurchase-priceTiers>dt' )
  @highlighted_price_tier = WebElement.new('.current.is-active' )
  @datasheet_download = WebElement.new(:class => 'js-download-button' )


  def get_min_amount
    @product_form.attribute('data-product-quantity-min').to_i
  end

  def get_max_amount
    @product_form.attribute('data-product-quantity-max').to_i
  end

  def get_increment_amount
    @product_form.attribute('data-product-increment').to_i
  end

  def set_qty_to_min
    @qty.send_keys get_min_amount
  end

  def buy_minimum
    set_qty_to_min
    @buy_btn.click
  end

  def is_total_price_visible
    !@total_price.attribute('class').include?('--increment')
  end

  def verify_total_price_visible
    @total_price.verify_attribute_not('class','--increment')
  end

  def verify_total_price_not_visible
    @total_price.verify_attribute('class','--increment')
  end

  # Returns the stock amount/number
  def get_available_stock
    available = @stock_available.text.gsub ',', ''
    available.to_i
  end

  # Returns all of the text in the Stock column. Will be empty if available qty = 0
  def get_stock_column_text
    @stock_column_text.text
  end

  def is_more_pricing_link_visible
    @more_prices.displayed?
  end

  # Returns the entire text
  def get_total_price_text
    @total_price.text
  end

  # Returns only the price amount as a float
  def get_total_price_amount
    get_total_price_text.sub('$', '').to_f
  end

  # Returns the Quantity from the the data-qauntity attribute as an int
  def get_stock_price_qty(div_element)
    div_element.attribute('data-quantity').to_i
  end

  # Returns the Quantity from the the data-price attribute as a float for calculations
  def get_stock_price(div_element)
    div_element.attribute('data-price').to_f
  end

  def open_part_page
    @product_name.click
    PartDetailsPage.new
  end


end

class ProductListingsPage < SearchResultsPage

  @page_url = "#{$base_url}/${search_path_with_param}"

  @search_results_containers = WebElement.new(:class => 'SearchResults-productName')
  @product_link = WebElement.new(class: 'SearchResults-productLink')
  @search_scroll_div = WebElement.new(:class => 'SearchResults-scrollWrapper')
  @first_buy_btn = WebElement.new(:class => 'ProductPurchase-buy')
  @first_back_order_btn = WebElement.new(:class => 'ProductPurchase-button--backOrder')
  @first_verical_btn = WebElement.new(:class => 'ProductPurchase-button--verical')
  @first_ecliptek_btn = WebElement.new(:class => 'ProductPurchase-button--ecliptek')
  @first_quote_btn = WebElement.new('a[href*=part-quote]')
  @discontinued_notifier = WebElement.new(class: 'SearchResults-productDiscontinued')
  @stock_onward_date = WebElement.new(:class => 'SearchResults-onwardDate')
  @product_searchresults = WebElement.new(class: 'SearchResults-productName')

  @description_heading = WebElement.new(".SearchResults-heading--description")
  @custom_heading = WebElement.new(".SearchResults-heading-feature")
  @quote_btns = WebElement.new("a[href*=quote]")
  @back_order_btn = WebElement.new('.ProductPurchase-button--backOrder')

  @part_number_heading = WebElement.new('th[data-sort-by="fullPart"]')
  @part_num_col= WebElement.new('.SearchResults-heading--partNumber')
  @part_num_ascending= WebElement.new('th[class="SearchResults-heading SearchResults-heading--partNumber isAscending"]')
  @part_num_descending= WebElement.new('th.SearchResults-heading.SearchResults-heading--partNumber.isDescending')

  @price_heading = WebElement.new('th[data-sort-by="calculatedPrice"]')
  @price_col= WebElement.new('.SearchResults-heading--price')
  @price_ascending= WebElement.new('th[class="SearchResults-heading SearchResults-heading--price isAscending"]')
  @price_descending= WebElement.new('th[class="SearchResults-heading SearchResults-heading--price isDescending"]')

  @stock_heading= WebElement.new('span[title="Stock"]')
  @stock_col= WebElement.new('th[data-column="stock"]')
  @stock_ascending= WebElement.new('th.SearchResults-heading.SearchResults-heading.isAscending')
  @stock_descending= WebElement.new('th.SearchResults-heading.SearchResults-heading.isDescending')

  @manufacturer_heading = WebElement.new('th[data-sort-by="Manufacturer_name"')
  @manufacturer_col= WebElement.new('.SearchResults-heading--manufacturer')
  @manufacturer_ascending= WebElement.new('th.SearchResults-heading.SearchResults-heading--manufacturer.isAscending')
  @manufacturer_descending= WebElement.new('th.SearchResults-heading.SearchResults-heading--manufacturer.isDescending')

  @type_heading = WebElement.new('th[data-sort-by="product_line_name"]')
  @type_col= WebElement.new('th[data-column="type"]')
  @type_ascending= WebElement.new('th.SearchResults-heading.SearchResults-heading.isAscending')
  @type_descending= WebElement.new('th.SearchResults-heading.SearchResults-heading.isDescending')

  @price_tiers = WebElement.new(".SearchResults-priceTiers")

  @product_items = ProductItem.new(".SearchResults-resultRow")

  @shipping = WebElement.new(class: 'SearchResults-onwardDate')
  @download_reference_design_span = WebElement.new(class: 'js-download-button')
  @close_results_column_buttons = WebElement.new(class: 'SearchResults-heading-closeButton')
  @disco_btn= WebElement.new('a','SearchResults-productDiscontinued')


  def verify_each_column_default(col)
    if col == "Part NO"
      @part_num_col.verify_visible
    elsif col == "Price"
      @price_col.verify_visible
    elsif col == "Stock"
      @stock_col.verify_visible
    elsif col == "Manufacturer"
      @manufacturer_col.verify_visible
    elsif col == "Type"
      @type_col.verify_visible
    end
  end

  def click_column(col)
    if col == "Part NO"
      @part_number_heading.click
    elsif col == "Price"
      @price_heading.click
    elsif col == "Stock"
      @stock_heading.click
    elsif col == "Manufacturer"
      @manufacturer_heading.click
    elsif col == "Type"
      @type_heading.click
    end
  end

  def verify_ascending_column(col)
    if col == "Part NO"
      @part_num_ascending.verify_visible
    elsif col == "Price"
      @price_ascending.verify_visible
    elsif col == "Stock"
      @stock_ascending.verify_visible
    elsif col == "Manufacturer"
      @manufacturer_ascending.verify_visible
    elsif col == "Type"
      @type_ascending.verify_visible
    end
  end

  def verify_descending_column(col)
    if col == "Part NO"
      @part_num_descending.verify_visible
    elsif col == "Price"
      @price_descending.verify_visible
    elsif col == "Stock"
      @stock_descending.verify_visible
    elsif col == "Manufacturer"
      @manufacturer_descending.verify_visible
    elsif col == "Type"
      @type_descending.verify_visible
    end
  end


  def url_with_product(product_search_string)
    "#{$base_url}/products/search?q=#{product_search_string}"
  end

  def verify_default_columns
    @part_number_heading.verify_visible
    @price_heading.verify_visible
    @stock_heading.verify_visible
    @manufacturer_heading.verify_visible
    @type_heading.verify_visible
    @description_heading.verify_visible
  end

  def verify_column_not_present(name)
    case name
      when "Manufacturer"
        @manufacturer_heading.verify_not_visible
      when "Type"
        @type_heading.verify_not_visible
      when "Description"
        @description_heading.verify_not_visible
      when "Stock"
        @stock_heading.verify_not_visible
    end
  end

  def self.close_first_visible_search_column
    #TODO: refactor to remove temporary variables
    visible_close_buttons = self.close_results_column_buttons.displayed_items
    number_of_close_buttons_before = visible_close_buttons
    visible_close_buttons.first.click
    visible_close_buttons_after = self.close_results_column_buttons.displayed_items
    number_of_close_buttons_before.count > visible_close_buttons_after.count
  end

  def back_to_top_link_displayed?
    @back_to_top.displayed?
  end

  def product_item_with_name(name)
    @product_items.where(:text,name).first
  end

  def is_discontinued?
    @discontinued_notifier.exists?
  end

  def download_reference_design
    @download_reference_design_span.click
  end

  def url_with_product_category(product_category_search_string)
    "#{$base_url}/products/search?cat=#{product_category_search_string}"
  end

  def url_with_all_products(product_search_string)
    "#{$base_url}/products/search?allproducts=true&amp;q=#{product_search_string}"
  end

  def search_results_page_number(product_search_string, page_number)
    url_with_product(product_search_string) + "&page=#{page_number}"
  end

  def go_to_search_results_page(product_search_string, page_number)
    $driver.get(search_results_page_number(product_search_string, page_number))
  end

  def search_for_product(product_search_string)
    $driver.get url_with_product(product_search_string)
  end

  def search_for_product_category(product_category_search_string)
    $driver.get url_with_product_category(product_category_search_string)
  end

  def search_for_all_products(product_search_string)
    $driver.get url_with_all_products(product_search_string)
  end

  def product_is_displayed?(product_search_string)
    @product_searchresults.verify_text(product_search_string)
  end

  def buy_minimum
    set_qty_to_min
    buy_btn
  end

  # Non-Arrow Parts cannot have a ProductItem class as they do not share same elements.
  @first_contact_us_section = WebElement.new(:class => 'SearchResults-notStocked')
  @first_contact_us_link = WebElement.new("a",@first_contact_us_section)

  # Are the scrollable columns present:
  def verify_overflow_visible
    @search_scroll_div.verify_attribute('class','overflowed')
  end
  # 
  # def first_item_with_buy_btn
  #   begin
  #     ProductItem.new(get_parent_row(@first_buy_btn))
  #   rescue
  #     raise "" "
  #              Cannot locate Buy button. This is usually caused by pricing API performance issues.
  #              Please check screen shot.
  #           " ""
  #   end
  # end
  # 
  # 
  # def first_item_with_back_order_btn
  #   ProductItem.new(@browser, get_parent_row(first_back_order_btn_element))
  # end
  # 
  # def first_item_with_ecliptek_btn
  #   ProductItem.new(@browser, get_parent_row(first_ecliptek_btn_element))
  # end
  # 
  # def first_item_with_quote_btn
  #   ProductItem.new(@browser, get_parent_row(first_quote_btn_element))
  # end
  # 
  # def first_item_with_verical_btn
  #   ProductItem.new(@browser, get_parent_row(first_verical_btn_element))
  # end

  def add_item_to_cart(item = FigNewton.product_for_purchase, quantity = 1)
    self.search_for_product item
    $driver.find_element(class: 'SearchResults-quantity ProductPurchase-quantity').send_keys quantity
    $driver.find_element(class: 'Button Button--red Button--full Button--small ProductPurchase-buy').click
  end

  def product_listing_text_is_new_format?
    date_displayed = @shipping.text
    'Can ship today' == date_displayed || 'Can ship tomorrow' == date_displayed || date_displayed =~ /Can ship in/
  end

  def product_listing_is_old_format?
    date_displayed = @shipping.text
    'Can ship today' != date_displayed || 'Can ship tomorrow' != date_displayed || date_displayed !~ /Can ship in/
  end

end