class SelectRegion < PageObject
  @modal_parent = WebElement.new(:class => 'Modal-dialog')

  def region_btn(btn_name_attribute)
    WebElement.new(:css => "button[name='#{btn_name_attribute}']")
  end

end