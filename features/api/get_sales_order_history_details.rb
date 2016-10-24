require 'json'
class GetSalesOrderHistoryDetails
  attr_reader :total, :subtotal, :shipping_total, :tax_total, :wire_transfer

  def initialize (number)

    url = FigNewton.cart_url + "/server-webapp/api/getSalesOrderHistoryDetails?format=json&orderID=#{number}"
    $driver.open_new_window(url)
    data = $driver.find_element(:css,"pre").text
    data = JSON.parse(data)["salesOrder"]
    print data
    @total = data["total"].to_s
    @subtotal = data["subtotal"].to_s
    @shipping_total = data["shippingTotal"].to_s
    @tax_total = data["taxTotal"].to_s
    @wire_transfer = data["wireTransfer"].to_s
    $driver.close
    $driver.switch_to.window( $driver.window_handles.first )
  end
end