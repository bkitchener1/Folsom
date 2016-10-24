class ResponsiveCarousel < PageObject
  @black_header = WebElement.new(:class => 'BlackHeader')

  #@manufacturer_module_responsive_carousel_parent = WebElement.new(:class => 'EventDetail-manufacturers')
  @cross_ref_module_responsive_carousel_parent = WebElement.new(:class => 'js-ajaxWrapper')
  @related_ref_des_module_responsive_carousel_parent = WebElement.new(:class => 'ResponsiveCarousel is-purple')

  @cross_ref_module_responsive_carousel_item = WebElement.new('.ResponsiveCarousel-slide.slick-slide')
  @manufacturer_module_responsive_carousel_item = WebElement.new('.ResponsiveCarousel-slide.slick-slide')
  @ref_des_module_responsive_carousel_item = WebElement.new(:class => 'InformationTile')
  #@responsive_carousel_items = WebElement.new(:class => 'ResponsiveCarousel-slide slick-slide')
  # @first_displayed_carousel) {responsive_carousel_items_elements.select {|carousel_elem|
  # carousel_elem.displayed?}.first}

  #for mobile and tablet
  @responsive_carousel_pagination = WebElement.new(:class => 'ResponsiveCarousel-pagination')


  def validate_reference_design_module_heading(heading_text)
    @lack_header.each do|elm|
      elm.verify_text heading_text
    end
  end

  def get_the_count_of_displayed_reference_design_related_modules
    @cross_ref_module_responsive_carousel_item.count
  end



end