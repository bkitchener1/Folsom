class PartsCatLandingPage < PageObject
  @page_url = "#{$base_url}/products/batteries"

  @parent_container = WebElement.new(:class => 'Part-Category')
  @part_title = WebElement.new({:class => 'u-middle'},@parent_container)
  @part_main_description = WebElement.new("h3",@parent_container)
  @body_description = WebElement.new("p",@parent_container)
  @product_selector = WebElement.new({:link_text => 'Product Selector'},@parent_container)
  @part_cat_stats = WebElement.new(".CategoryListings-subItems-item",@parent_container)
  @product_counter_parent = WebElement.new(:class => 'CounterCarousel CounterCarousel--2')

  @sub_prod_cat_link = WebElement.new(:css => 'ul.CategoryListings-items a')
  @sub_prod_cat_heading = WebElement.new(:css => 'ul.CategoryListings-items li h3')
  @prod_line_page_link = WebElement.new(".CategoryListings-subItems-item")

  #ResearchAndEvents
  @research_and_event_parent = WebElement.new(:class => 'Content u-cf')
  @research_and_events_heading = WebElement.new({:class => 'BlackHeader'},@research_and_event_parent)

  def click_link_for_prod_sub_category
    #sub_prod_cat_link_elements.first.click
    @prod_line_page_link.click

  end

  def click_link_for_prod_line_page
    @prod_line_page_link.click

    @sub_prod_cat_link.first.click
  end

  # def parts_stats_div(parent_elem)
  #   parent_elem.div_element(:class => 'Part-Category-ctas u-cf')
  # end

  def validate_product_counter_position
    @product_counter_parent.attribute('class').include?('slick-initialized slick-slider')
  end

  def click_product_selector_button
    @product_selector.click

  end


end