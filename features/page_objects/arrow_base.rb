class ArrowBase < PageObject

  def verify_page_integrity
    page_errors = ["An unhandled exception occurred", "Sorry, we haven't got that page", "This page doesn't exist", "Rendering exception", "This site can't be reached"]

    @page_source = $driver.page_source
    page_errors.each do |s|
      if @page_source.include?(s)
        @page_status = s
        #TODO: find a better regex than the one below. Following written in a hurry(!)
        @server_name = $driver.page_source.match(/(\bSource\b : ...............)/)
      else
        @page_status ||= nil
      end
    end

    raise "URL DID NOT LOAD SMOOTHLY: #{$driver.current_url}. Error: #{@page_status}. Server: #{@server_name}" unless (@page_status).nil?
    $logger.info "Verified #{$driver.current_url} loaded without Rendering Exceptions"
  end


  # search page
  def verify_search_page_no_errors
    page_errors = ["Sorry, your search returned no results."]
    @page_source = $driver.page_source
    page_errors.each do |s|
      if @page_source.include?(s)
        @page_status = s
        #TODO: find a better regex than the one below. Following written in a hurry(!)
        @server_name = $driver.page_source.match(/(\bSource\b : ...............)/)
      else
        @page_status ||= nil
      end
    end

    raise "SEARCH RETURNED NO RESULTS: #{$driver.current_url}. Error: #{@page_status}. Server: #{@server_name}" unless (@page_status).nil?
    $logger.info "Verified #{$driver.current_url} SEARCH RETURNED WITH OUT Exceptions"
  end
end