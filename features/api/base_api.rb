class BaseApi
  attr_reader :uri, :response, :json

  def initialize
    execute_api_request
  end

  def get_uri uri
    $driver.open_new_window(uri)
    $driver.close
    $driver.switch_to.window( $driver.window_handles.first )
  end

  def execute_api_request
    $driver.open_new_window(@uri)
    pre = WebElement.new("pre")
    pre.verify_visible
    @response = pre.text
    if @response == ""
      raise "API call failed, blank response detected at #{$driver.current_url}"
    end
    @json = get_json
    $driver.close
    $driver.switch_to.window( $driver.window_handles.first )
    return self
  end

  def get_json
    JSON.parse(@response)
  end
end