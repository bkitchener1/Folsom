require 'json'
class CartEntry
  attr_reader :id, :mpn, :manufacturer, :description, :unit_price, :quantity, :item_total, :available_quantity, :min_quanitty, :compliant

  def initialize(data)
    @data = data
    @id = @data["catalogSourcePartId"]
    @mpn = @data["mpn"]
    @manufacturer = @data["manufacturer"]
    @description = @data["partDescription"]
    @unit_price = @data["unitPrice"]
    @quantity = @data["quantity"]
    @item_total = @data["itemTotal"].to_f.round(2)
    @available_quantity = @data["availableQuantity"]
    @min_quanity = @data["minimumOrderQuantity"]
    @compliant = @data["rohsCompliant"]
  end
end

class GetCartContents

  def initialize ()
    $driver.open_new_window(FigNewton.cart_url + "/server-webapp/api/getCartContents?format=json")
    data = $driver.find_element(:css,"pre").text
    data = JSON.parse(data)
    @entries = data["entries"]
    @cart_items = {}
    $driver.close
    $driver.switch_to.window( $driver.window_handles.first )
    @entries.each do |entry|
      @cart_items[entry["catalogSourcePartId"]] = CartEntry.new(entry)
    end
  end

  def cart_items
    @cart_items
  end

  def cart_item(num)
    CartEntry.new(@entries[num])
  end
end