require 'json'
class CartHandover

  def initialize ()

    url = FigNewton.base_url + "/api/cartHandover"
    $driver.open_new_window(url)
    data = $driver.find_element(:css,"body").text
    data = JSON.parse(data)
    @exchange_rates = data["Data"]["ExchangeRates"]
    $driver.close
    $driver.switch_to.window( $driver.window_handles.first )
  end

  def get_exchange_rate(type)
    for rate in @exchange_rates
      if rate["CurrencyCode"] == type
        return rate["ExchangeRate"]
      end
    end
      return 1
  end
end