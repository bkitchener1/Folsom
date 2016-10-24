class RegionSelectModal < PageObject
  @button_list = WebElement.new("ul[class='Centered-buttons RegionSelection-buttonList']")

  def select_region(region)
    @region_button= WebElement.new("button[name='#{region}']")
    @region_button.click
  end


end