class CacheControlPage < AdminInstrumentsPage

  @page_url = "#{$base_url}/admininstruments/cache"

  @clear_all_button = WebElement.new('.button')

  def clear_cache
    $driver.get($base_url + '/admininstruments/cache/clearcache')
  end

end