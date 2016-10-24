class DatasheetViewer < PageObject

  @datasheet_viewer = WebElement.new(:class => 'DatasheetViewer')
  # There can be more than 1 div with same class name. Use a collection, and get the last one:
  #@datasheet_viewer_parent = WebElement.new() { datasheet_viewers_elements.last }
  @datasheet_viewer_image = WebElement.new(class: 'pg1Overlay')
  @datasheet_viewer_left = WebElement.new(:class => 'js-datasheetViewer-mainCarousel-leftArrow')
  @datasheet_viewer_right = WebElement.new(:class => 'js-datasheetViewer-mainCarousel-rightArrow')


  def datasheet_viewer_displayed?
    @datasheet_viewers.last.verify_present.displayed?
  end

  def does_datasheet_viewer_exist?
    !@datasheet_viewers.exists?
  end
end