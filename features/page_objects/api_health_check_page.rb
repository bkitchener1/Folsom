class ApiHealthCheckPage < PageObject

  @page_url = "#{$base_url}/healthcheck/cairoAPI"

  def verify_healthy
    $driver.verify_html('"OverallStatus":true')
  end

end