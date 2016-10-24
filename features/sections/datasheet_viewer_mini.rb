class DatasheetViewerMini < PageObject

  @datasheet_mini_viewer_parent = WebElement.new(:class => 'DatasheetViewer--mini')
  @datasheet_mini_viewer_header = WebElement.new("h2",@datasheet_mini_viewer_parent)
  @datasheet_mini_viewer_image = WebElement.new("img",@datasheet_mini_viewer_parent)
  @view_datasheet_from_mini_viewer_btn = WebElement.new("a",@datasheet_mini_viewer_parent)
  @download_datasheet_from_mini_viewer_btn = WebElement.new(".Button",@datasheet_mini_viewer_parent)

  def get_datasheet_mini_img_href
    @datasheet_mini_viewer_image.attribute('href')
  end

  def get_datasheet_mini_view_btn_href
    @view_datasheet_from_mini_viewer_btn.attribute('href')
  end

  def get_datasheet_mini_download_btn_href
    @download_datasheet_from_mini_viewer_btn.attribute('href')
  end

end