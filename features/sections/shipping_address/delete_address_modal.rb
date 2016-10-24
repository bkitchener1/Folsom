require_relative '../../support/page_object'

class DeleteAddressModal < PageObject
  @address = WebElement.new({:css => ".container"})
  @close = WebElement.new({:css => "button[ng-click*=close]"})
  @update = WebElement.new({:css => "button[ng-click*=ok]"})
  @remove_text = WebElement.new("span.form-group")

  def verify_modal
    @address.verify_visible
    @close.verify_visible
    @update.verify_visible
    @remove_text.verify_text("Remove this address")
  end
end
