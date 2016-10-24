class BuyingOption < PageObject

  @qty = WebElement.new(:class => 'ProductPurchase-quantity')
  @buy_btn = WebElement.new(:class => 'ProductPurchase-buy')
  @product_form = WebElement.new(:class => 'BuyingOption-purchase')
  @price_tiers = WebElement.new(:css => 'dl.ProductPurchase-priceTiers>dt')
  @total_price = WebElement.new(:class => 'BuyingOption-total-price')
  @stock_count = WebElement.new(:class => 'BuyingOption-stock-count')
  @pipeline_link = WebElement.new(:class => 'BuyingOption-pipeline')
  @increments = WebElement.new('.BuyingOption-increments')

  def get_total_price
    @total_price.text
  end

  def set_qty_to_min
    @qty.set_text get_min_amount
  end

  def set_qty_to_less_than_min
    @qty.set_text (get_min_amount - 1)
  end

  def set_qty_to_more_than_max
    @qty.set_text (get_max_amount + 1)
  end

  def get_min_amount
    @product_form.attribute('data-product-quantity-min').to_i
  end

  def get_max_amount
    @product_form.attribute('data-product-quantity-max').to_i
  end

  # Returns the Quantity from the the data-quantity attribute as an int
  def get_stock_price_qty
    @product_form.attribute('data-quantity').to_i
  end

  # Returns the Quantity from the the data-price attribute as a float for calculations
  def get_stock_price
    @price_tiers.first.attribute('data-price').to_f
  end

  def get_stock_count
    @stock_count.text.gsub!(',', '').to_i
  end

  def is_pipeline_link_visible
    @pipeline_link.present?
  end

  def open_pipeline_tooltip
    @pipeline_link.click
  end

#############################################
# Ecliptek locators
@ecliptek_section = WebElement.new(:class => 'BuyingOption--ecliptek')
@ecliptek_btn = WebElement.new(".Button--full",@ecliptek_section)
@quote_section = WebElement.new(:class => 'BuyingOption--quote')
@quote_btn = WebElement.new(".Button--full",@quote_section)

def ecliptek_url
  @ecliptek_btn.attribute('href')
end

def is_ecliptek_visible
  @ecliptek_section.displayed?
end

def quote_url
  @quote_btn.attribute('href')
end

def is_quote_visible
  @quote_section.displayed?
end

#############################################
# Verical locators
@verical_section = WebElement.new(:class => 'BuyingOption--verical')
@verical_btn = WebElement.new(".Button--full",@verical_section)

def verical_url
  @verical_btn.attribute('href')
end

def is_verical_visible
  @verical_section.displayed?
end
#############################################
# Discontinued locators
@discontinued_section = WebElement.new(:class => 'BuyingOption--discontinued')

def is_discontinued_notification_visible?
  @discontinued_section.displayed?
end
#############################################



  @contact_text = WebElement.new(:class => 'BuyingOption-contact')
  @get_by_text = WebElement.new(:class => 'BuyingOption-getBy') #Approximation.

  # Element changed, can no longer locate precisely.
  @stock_status = WebElement.new(:class => 'BuyingOption-stock')
  @stock_count = WebElement.new(:class => 'BuyingOption-stock-count')

  #############################################
  # Back Order locators
  @back_order_section = WebElement.new(:class => 'BuyingOption--backOrder')
  @back_order_btn = WebElement.new({:class => 'Button--full'},@back_order_section)
  @back_order_modal = WebElement.new(:class => 'Modal-backOrder')
  @first_name = WebElement.new(:id => 'inputFirstName')
  @last_name = WebElement.new(:id => 'inputLastName')
  @company = WebElement.new(:id => 'inputCompany')
  @location = WebElement.new(:id => 'inputLocation')
  @email = WebElement.new(:id => 'inputEmail')
  @manufacturer= WebElement.new(:id => 'inputMfr')
  @quantity= WebElement.new(:id => 'inputQuantity')
  @project_name= WebElement.new(:id => 'inputProject')
  @end_customer= WebElement.new(:id => 'inputEndCustomer')
  @send_request= WebElement.new(:class => 'btn btn-red ng-binding')

  def verify_form_fields
    if @back_order_modal.attribute('BAV99_D87Z')
      @first_name.displayed?
      @last_name.displayed?
      @company.displayed?
      @location.displayed?
      @email.displayed?
      @manufacturer.attribute('Fairchild Semiconductor')
      @quantity.displayed?
      @project_name.displayed?
      @end_customer.displayed?
      @send_request.displayed?
    end
  end

  #def back_order_form
  #  @back_order_modal.attribute('BAV99_D87Z')
  #end

  #def is_first_name_visible
  #  @first_name.displayed?
  #end

  #def is_last_name_visible
  #  @last_name.displayed?
  #end

  #def is_company_visible
  #  @company.displayed?
  #end

  #def is_location_visible
  #  @location.displayed?
  #end

  #def is_email_visible
  #  @email.displayed?
  #end

  #def is_manufacture_visible
  #  @manufacturer.attribute('Fairchild Semiconductor')
  #end

  #def is_quantity_visible
  #  @quantity.displayed?
  #end

  #def is_project_name_visible
  #  @project_name.displayed?
  #end

  #def is_end_customer_visible
  #  @end_customer.displayed?
  #end

  #def is_send_request_visible
  #  @send_request.displayed?
  #end

  #############################################
  # Add to Cart Option locators
  @all_buying_options = WebElement.new(:class => 'BuyingOption')
  @buy_section = WebElement.new(:class => 'BuyingOption--addToCart')
  @pipeline = WebElement.new(:class => 'BuyingOption-pipeline')



  def back_order_url
    @back_order_btn.attribute('href')
  end


  def is_first_buy_section_visible
    @buy_section.first.displayed?
  end

  def is_second_buy_section_visible
    @buy_section[1].displayed?
  end
end

class PartDetailsPage < PageObject

  @page_url = "#{$base_url}/${part_url}"

  # Part Details/attributes locators
  @part_summary = WebElement.new(:class => 'Product-Summary-Name')
  @part_summary_details = WebElement.new(:class => 'Part-Summary-Details')
  @share_btn = WebElement.new(:class => 'Icon--share')
  @add_content_btn = WebElement.new(:class => 'Icon--save')
  @summary_headers = WebElement.new(:css => 'div.Part-Summary-Details h4')
  @rating_stars = WebElement.new({:class => 'Icon--star'},@part_summary)
  @manufacturer_div = WebElement.new(:class => 'Product-Summary-Details')
  @manufacturer_header = WebElement.new("h4",@manufacturer_div)
  @manufacturer = WebElement.new("a",@manufacturer_div)

  #@product_cat_div = WebElement.new(:class => 'Part-Summary-Details-category')

  # locator update
  @product_cat_div = WebElement.new(:class=>'Product-Summary-Details')
  @product_cat_header = WebElement.new("h4",@product_cat_div)
  @product_cat = WebElement.new("a",@product_cat_div)

  # locator update
  #@description = WebElement.new(:class => 'Product-Summary-Details-description')
  @description = WebElement.new("p[itemprop='description']")
  @description_text = WebElement.new("p", @description)
  @spec_list_container = WebElement.new(class: 'Part-Specifications-list Part-Specifications-list--containsSubLists')

  @design_with_envision_parent = WebElement.new('.Part-Summary-Footer',@part_summary)

  @design_with_envision_icon = WebElement.new('.Icon--envision',@part_summary)
  @design_with_envision_link = WebElement.new('a',@design_with_envision_parent)

  #ResearchAndEvents
  @research_and_event_parent = WebElement.new(:id => 'GoToReasearchAndEvents')
  @research_and_events_heading = WebElement.new(".BlackHeader",@research_and_event_parent)

  #CrossRefHeading
  @cross_ref_heading_parent = WebElement.new(:class => 'js-ajaxWrapper')
  @cross_ref_heading = WebElement.new(".BlackHeader",@cross_ref_heading_parent)

  #TODO: Push out to module
  @datasheet_download_button = WebElement.new(".DatasheetViewer button.js-download-button")
  @header_datasheet_download_button = WebElement.new(".DatasheetToolbar button.js-download-button")


  @buying_options = BuyingOption.new(".BuyingOption")

  def rating_stars_size
    @rating_stars.count
  end

  def verify_datasheet_url_is_correct
    @datasheet_download_button.verify_present.verify_attribute('data-url',"//static6.arrow.com/aropdfconversion/")
    @datasheet_download_button.verify_attribute('data-url',".pdf")
  end

  def verify_header_datasheet_url_is_correct
    @header_datasheet_download_button.verify_present.verify_attribute('data-url',"//static6.arrow.com/aropdfconversion/")
    @header_datasheet_download_button.verify_attribute('data-url', ".pdf")
  end

  def manufacturer_text
    @manufacturer.text
  end

  def manufacturer_href
    @manufacturer.attribute('href')
  end

  def is_manufacturer_visible
    @manufacturer.displayed?
  end

  def open_manufacturer_page
    @manufacturer.click
    ManufacturersDetailPage.new
  end

  def product_cat_text
    @product_cat.text
  end

  def is_product_cat_visible
    @product_cat.displayed?
  end

  def is_description_visible
    if @description.present?
      @description_text != ''
    else
      true
    end
  end

  def download_datasheet
    @datasheet_download_button.click
  end

  #############################################
  # Part Specification locators
  # Using list_items with css instead of unordered_list is much more efficient to get the size.
  @specifications = WebElement.new(:css => 'ul.Part-Specifications-list>li')

  def specifications_size
    @specifications.count
  end



  #
  # def is_part_spec_imported_from_devkit?
  #   self.wait_until(
  #       FigNewton.impl_timeout, locator_failure_error(imported_from_devkit_indicator_element)
  #   ) do
  #     imported_from_devkit_indicator?
  #   end
  #   imported_from_devkit_indicator?
  # end

end