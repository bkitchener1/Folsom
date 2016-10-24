class DatasheetToolbarModule < PageObject
  @root = WebElement.new(:class => 'DatasheetToolbar')
  @datasheet_toolbar_title = WebElement.new(:class => 'DatasheetToolbar-title')
  @datasheet_toolbar_date = WebElement.new(:class => 'DatasheetToolbar-date')
  @datasheet_toolbar_counter_total = WebElement.new({:class => 'DatasheetDetail-pageCounter-total'})
  @datasheet_toolbar_counter_input = WebElement.new(:class => 'DatasheetDetail-pageCounter-count')
  @download_datasheet_from_toolbar_btn = WebElement.new(:class => 'DatasheetToolbar-button')
  @datasheet_toolbar_events_icon = WebElement.new({:class => 'Icon--events'},@root)
  @share_content_btn = WebElement.new("a.Icon--share",@root)
  @add_content_btn = WebElement.new(".Icon--save",@root)
  @datasheet_slides = WebElement.new("a.ThumbnailCarousel-slide")

  def is_datasheet_toolbar_visible
    @datasheet_toolbar_parent.displayed?
  end

  def datasheets_toolbar_has_events_icon
    @datasheet_toolbar_events_icon.displayed?
  end

  def is_datasheet_toolbar_counter_visible
    @datasheet_toolbar_counter_total.displayed?
  end

  def get_download_datasheet_from_toolbar_href
    @download_datasheet_from_toolbar_btn.attribute('data-url')
  end

  def get_datasheet_toolbar_total
    @datasheet_toolbar_counter_total.text.to_i
  end

  def submit_datasheet_page_no(page_no)
    @datasheet_toolbar_counter_input.send_keys(:backspace, page_no, :enter)
  end

  def verify_last_slide_active
    total = get_datasheet_toolbar_total
    @datasheet_slides[total - 1].verify_attribute("class", "is-selected")
  end

  def verify_slide_active(num)
    @datasheet_slides[num.to_i - 1].verify_attribute("class", "is-selected")
  end

end