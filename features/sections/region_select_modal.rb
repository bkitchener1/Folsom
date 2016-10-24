class RegionSelectModalPage < PageObject

  @button_list = WebElement.new('.Centered-buttons.RegionSelection-buttonList')

  def select_region(region='americas')
    @button_list.verify_visible
    WebElement.new("[name=#{region}]").click
  end

end