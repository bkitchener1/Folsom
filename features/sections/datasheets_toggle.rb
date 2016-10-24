
class DatasheetsToggle < PageObject
  @datasheets_toggle_parent = WebElement.new(:class => 'SearchControls-datasheetContainer')
  @datasheets_toggle = WebElement.new('a.Datasheet-toggle')

  def click_to_toggle_datasheets
    @datasheets_toggle.click
  end

end

