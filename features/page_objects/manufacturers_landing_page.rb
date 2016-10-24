class ManufacturersLandingPage < PageObject
  # include ManufacturersTabsModule
  # include ResponsiveCarousel

  @page_url = "#{$base_url}/products/manufacturers"

  @manu_header = WebElement.new(:class => 'ManuHeader-info-heading')
  @info_large = WebElement.new(:class => 'ManuHeader-info-paragraph')
  @info_small = WebElement.new(:class => 'ManuHeader-info-paragraph')
  @active_view_type = WebElement.new(:class => 'ManufacturersTabs-results-icons--is-active')
  @linecards_div = WebElement.new(:class => 'ManufacturersTabs-results-linecards')
  @linecards = WebElement.new(:class => 'GridList-Items-item')

  @active_tab = WebElement.new('.ManufacturersTabs-tab-link--is-selected')

  def is_title_displayed
    @manu_header.displayed?
  end

  def is_para_one_displayed
    @info_large.displayed?
  end

  def is_para_two_displayed
    @info_small.displayed?
  end

  def is_linecards_displayed
    @linecards_div.displayed?
  end

  def linecards_size
    @linecards.count
  end

  def get_active_view_type
    @active_view_type.attribute('data-viewtype')
  end
end