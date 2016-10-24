class ReferenceDesignLandingPage < PageObject
  @page_url = "#{$base_url}/reference-designs"

  @by_application = WebElement.new(:css => %q!button[data-category-type="application"]!)
  @by_end_product = WebElement.new(:css => %q!button[data-category-type="end-product"]!)
  @by_manufacturer = WebElement.new(:css => %q!button[data-category-type="manufacturer"]!)

  @application_section = WebElement.new(:css => %q!section[data-category-type="application"]!)
  @manufacturer_section = WebElement.new(:css => %q!section[data-category-type="manufacturer"]!)
  @end_product_section = WebElement.new(:css => %q!section[data-category-type="end-product"]!)
  @active_results_section = WebElement.new(:class => 'RefDrawerTabs-results-section--is-active')
  @first_result_item = WebElement.new({:class => 'RefDrawerTabs-results-item'},@active_results_section)
  @first_draw_item = WebElement.new({:class => 'RefDrawerTabs-drawer-item'},@first_result_item)

  @first_result_item_all_count = WebElement.new({:class => 'RefDrawerTabs-count--all'},@first_result_item)
  @first_result_item_interactive_count = WebElement.new({:class => 'RefDrawerTabs-count--interactive'},@first_result_item)

  @new_design_heading_parent = WebElement.new(:class => 'ReferenceDesigns-section--related')
  @browse_container = WebElement.new(:class => 'ReferenceDesigns-Browse-container')
  @new_design_heading = WebElement.new({:class => 'BlackHeader'},@new_design_heading_parent)
  @all_designs_radio = WebElement.new(:id => 'filter-all')
  @interactive_designs_radio = WebElement.new(:id => 'filter-interactive')
  @manufacturer_btn = WebElement.new('button[data-category-type="manufacturer"]')

  @result_items = ResultItem.new(".ManufacturersTabs-results-item")

  def safe_click_by_manufacturer_button
    $driver.scroll_top
    @manufacturer_btn.click
  end
  #
  # def is_manufacturers_active
  #   does_element_contain_is_active(@manufacturer_section)
  # end
  # def is_end_products_active
  #   does_element_contain_is_active(@end_product_section)
  # end
  # def is_result_item_expanded(li_elem)
  #   does_element_contain_is_visible(li_elem)
  # end

  def filter_by_end_product
    @by_end_product.verify_present.click
  end
  #
  # def is_filtered_by_interactive_designs
  #   browse_container_element.attribute('class').end_with? 'u-showCount-interactive'
  # end

  def is_filtered_by_all_designs
    browse_container_element.attribute('class').end_with? 'u-showCount-all'
  end

  def click_all_designs_filter
    @browser.label(:css => %q!label[for="filter-all"]!).click
  end

  @interactive_designs_label = WebElement.new('label[for="filter-interactive"]')
  def click_interactive_designs_filter
    @interactive_designs_label.click
  end

  def get_count_num(text)
    text.gsub(/[^a-z]/i, '')
  end

  def dismiss_cookie_warning
    accept_cookie_class_name = '.Button--inverted-colors.js-accept'
    ele = WebElement.new(class: accept_cookie_class_name)
    if ele.present?
      ele.click
    end
  end
end