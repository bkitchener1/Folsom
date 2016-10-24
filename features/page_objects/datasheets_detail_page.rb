class DatasheetsDetailPage < PageObject

  @page_url = "#{$base_url}/datasheets/${datasheet_id}#page-1"

  @datasheet_title = WebElement.new(:class => 'DatasheetDetail-title-text')
  @datasheet_icons_parent = WebElement.new(:class => 'DatasheetToolbar-icons')
  @datasheet_save_icon = WebElement.new(".Icon--save",@datasheet_icons_parent)
  @tabbed_responsive_carousel = WebElement.new('.ThumbnailCarousel-carousel')

  def click_save_to_project_image
    @datasheet_save_icon.verify_visible.click
  end

  def is_displayed?
    @datasheet_save_icon.verify_present
  end

end