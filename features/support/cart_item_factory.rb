require 'json'

class CartItemFactory
  def initialize (item_id, quantity, sourceCode="NAC")

    @item_id = item_id
    url = FigNewton.cart_url + "server-webapp/api/addToCartExternal?format=jsonp&currency=USD&sourceCodes=#{sourceCode}&itemIDs=#{item_id}&quantities=#{quantity}&callback=_jqjsp&_1445622334375="
    $driver.get(url)
    data = $driver.find_element(:css,"body").text
    if data.include? "errorMessage" and not data.include? "shoppingCart.alreadyInCart"
      raise "Could not add an item to the cart : #{data}"
    end
  end

end