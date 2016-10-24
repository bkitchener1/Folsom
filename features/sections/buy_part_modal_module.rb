class BuyPartModalModule < PageObject
  @qty_confirmation_popup = WebElement.new(:css =>'form[novalidate="novalidate"]')

  def is_qty_confirmation_popup_visible
    @qty_confirmation_popup.exists?
  end
end