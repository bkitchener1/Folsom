require_relative '../support/web_element'

module Selenium
  module WebDriver
    module SearchContext

      def find_element(*args)
        how, what, name = extract_args(args)

        unless by = FINDERS[how.to_sym]
          raise ArgumentError, "cannot find element by #{how.inspect}"
        end
        $logger.info "Finding #{name}: #{by}:#{what}"
        element = bridge.find_element_by by, what.to_s, ref
        element.instance_variable_set(:@name, name)
        if $highlight
          element.highlight(0.1)
        end
        element
      rescue Selenium::WebDriver::Error::TimeOutError
        # Implicit Wait times out in Edge
        raise Selenium::WebDriver::Error::NoSuchElementError
      end

      def find_elements(*args)
        how, what, name = extract_args(args)
        unless by = FINDERS[how.to_sym]
          raise ArgumentError, "cannot find elements by #{how.inspect}"
        end
        $logger.info "Finding #{name}: #{by}:#{what}"
        elements = bridge.find_elements_by by, what.to_s, ref
        elements.each do |element|
          element.instance_variable_set(:@name, name)
        end
        if $highlight
          elements.each do |element|
            element.highlight(0.1)
          end
        end
        elements
      rescue Selenium::WebDriver::Error::TimeOutError
        # Implicit Wait times out in Edge
        []
      end

      def extract_args(args)
        case args.size
          when 3
            args
          when 2
            args
          when 1
            arg = args.first

            unless arg.respond_to?(:shift)
              raise ArgumentError, "expected #{arg.inspect}:#{arg.class} to respond to #shift"
            end

            # this will be a single-entry hash, so use #shift over #first or #[]
            arr = arg.dup.shift
            unless arr.size >= 2
              raise ArgumentError, "expected #{arr.inspect} to have > 2 elements"
            end

            arr
          else
            raise ArgumentError, "wrong number of arguments (#{args.size} for 2)"
        end
      end
    end
    class Driver
      def open_new_window(url)
        execute_script("window.open('');")
        sleep 3
        switch_to.window(window_handles.last )
        get url

      end

      def wait_for_ajax(timeout = $page_timeout)
        wait_for_jquery(timeout)
        wait_for_angular(timeout)
      end

      def wait_for_jquery(timeout)
        end_time = ::Time.now + timeout
        until ::Time.now > end_time
          begin
            loaded =  execute_script('return (typeof jQuery === "undefined" || jQuery.active==0);')
            return if loaded
            sleep 1.0
            $logger.info "Waiting for jQuery AJAX"
          rescue
          end
        end
        message = "Timed out waiting #{timeout} seconds for ajax requests to complete"
        $logger.error message
      end

      def wait_for_angular(timeout)
        end_time = ::Time.now + timeout
        until ::Time.now > end_time
          begin
            page_loaded =  execute_script('return (typeof angular === "undefined" || angular.element(document.body).injector().get("$http").pendingRequests.length==0);')
            return if page_loaded
            sleep 1.0
            $logger.info "Waiting for ANGULAR AJAX"
          rescue
          end
        end
        message = "Timed out waiting #{timeout} seconds for ajax requests to complete"
        $logger.error message
      end

      def scroll_up(amount = 250)
        execute_script("scroll(#{amount},0)")
      end

      def scroll_down(amount = 250)
        execute_script("scroll(0,#{amount})")
      end

      def scroll_top
        execute_script('window.scrollTo(0, 0);')
      end

      def scroll_bottom
        execute_script('window.scrollTo(0, document.body.scrollHeight);')
      end

      def scroll_to x, y
        execute_script("scrollTo(#{x},#{y})")
      end

      def get(url)
        navigate.to(url)
      rescue Net::ReadTimeout
        $logger.fatal "Timed out fetching page, retrying"
        navigate.to(url)
      rescue Net::ReadTimeout
        $logger.fatal "Timed out fetching page, retrying"
        navigate.to(url)
      end

      def hostname url
        URI.parse(url).host
      end


      def get_inner_width
        script_inner = <<-JS
    var width = window.innerWidth
    return width
        JS
        self.execute_script(script_inner)
      end

      def get_outer_width
        script_outer = <<-JS
          var width = window.outerWidth
          return width
        JS
        self.execute_script(script_outer)
      end

      def resize_viewport(width, height)
        self.manage.window.resize_to(width, height)

        inner_width = get_inner_width
        outer_width = get_outer_width

        if inner_width < width
          diff           = outer_width - inner_width
          viewport_width = width + diff
          self.manage.window.resize_to(viewport_width, height)
        end

      end

      def wait(message, timeout=$element_timeout)
        Selenium::WebDriver::Wait.new :timeout => timeout, :interval => 1, :ignore=>[Selenium::WebDriver::Error::NoSuchElementError,Selenium::WebDriver::Error::StaleElementReferenceError], :message=>message
      end

      def switch_to_new_window
        wait("Only 1 window found").until do
          $driver.window_handles.count > 1
        end
        $driver.switch_to.window($driver.window_handles.last)
      end

      def switch_to_default_window
        if $driver.window_handles.count > 1
          switch_to_new_window
          $driver.close
        end
        $driver.switch_to.window($driver.window_handles.first)
      end

      def verify_new_window_url(url)
        switch_to.window(window_handles.last)
        verify_url(url)
        $driver.close
        switch_to.window(window_handles.first)
      end

      def verify_url(value, timeout=$page_timeout)
        wait("Page URL was not correct after #{timeout} seconds.  Expected '#{value}' Got '#{self.current_url}'",timeout).until {
          self.current_url.include? value
        }
        $logger.info "Verified URL is '#{value}'"
        self
      end

      def verify_url_not(value, timeout=$page_timeout)
        wait("Page URL is still '#{self.current_url}' after #{timeout} seconds. Expected #{value}",timeout).until {
          not self.current_url.include? value
        }
        $logger.info "Verified URL is NOT '#{value}'"
        self
      end

      def verify_html(value, timeout=$page_timeout)
        wait("Page HTML source was not correct after #{timeout} seconds.  Expected '#{value}' to be present in the HTML #{self.page_source}",timeout).until {
          self.page_source.include? value
        }
        $logger.info "Verified Page HTML contains '#{value}'"
        self
      end

      def verify_html_not(value, timeout=$page_timeout)
        wait("Page HTML source still contains '#{value}' after #{timeout} seconds.",timeout).until {
          not self.page_source.include? value
        }
        $logger.info "Verified Page HTML does not contain '#{value}'"
        self
      end

      def verify_title(value, timeout=$page_timeout)
        wait("Page Title was not correct after #{timeout} seconds.  Expected '#{value}' Got '#{self.title}'",timeout).until {
          self.title.include? value
        }
        $logger.info "Verified page title contains '#{value}'"
        self
      end

      def verify_title_not(value, timeout=$page_timeout)
        wait("Page title still contains '#{value}' after #{timeout} seconds.",timeout).until {
          not self.title.include? value
        }
        $logger.info "Verified page title does not contain '#{value}'"
        self
      end
    end

    class Element
      def highlight(time=0.1, color="yellow")
        original_background = $driver.execute_script("return arguments[0].style.backgroundColor", self)
        $driver.execute_script("arguments[0].style.backgroundColor='#{color}'; return;", self)
        if time == -1
          return
        end
        sleep (time.to_f)
        $driver.execute_script("arguments[0].style.backgroundColor='" + original_background + "'; return;", self)
      rescue Selenium::WebDriver::Error::StaleElementReferenceError
      end
      def html()
        attribute("outerHTML")
      rescue Selenium::WebDriver::Error::StaleElementReferenceError
      end
      def set_text(value)
        clear
        send_keys(value)
      end
      def scroll_into_view()
        $driver.execute_script("arguments[0].scrollIntoView(); return;", self)
      end
      def text
        text = bridge.getElementText @id
        if not displayed? and text == ""
          $logger.info "Warning, text will be blank for hidden elements"
        end
        text
      end
      def js_click
        $driver.execute_script("arguments[0].click(); return;", self)
        highlight(color="red")
      end
      def set_value(value)
        $driver.execute_script("arguments[0].value='#{value.to_s}'; return;", self)
      end
    end
  end
end

class NavigationListener < Selenium::WebDriver::Support::AbstractEventListener
  def after_navigate_to(url, driver)
    if driver.title == "Certificate Error: Navigation Blocked"
      driver.get("javascript:document.getElementById('overridelink').click();")
    end
  rescue
  end

  def before_navigate_to(url, driver)
    driver.wait_for_ajax($element_timeout)
    if url.include? "https://uat"
      url = url.sub(FigNewton.base_url, "")
      url = "#{FigNewton.base_url}:443#{url}"
    end
    $logger.info "Navigating to #{url}"
  rescue
  end

  def before_navigate_back(driver)
    driver.wait_for_ajax($element_timeout)
    $logger.info "Navigating back"
  rescue
  end

  def after_navigate_forward(driver)
    driver.wait_for_ajax
  rescue
  end

  def before_navigate_forward(driver)
    driver.wait_for_ajax($element_timeout)
    $logger.info "Navigating forward"
  rescue
  end

  def before_find(by, what, driver)
    driver.wait_for_ajax($element_timeout)
  rescue
  end

  def before_click(element, driver)
    if $highlight
      element.highlight(0.1, "red")
    end
    $logger.info "Clicking #{}: #{element.html}"
  rescue
  end

  def before_change_value_of(element, driver)
    if $highlight
      element.highlight(0.1, "red")
    end
  end

  def after_change_value_of(element, driver)
    $logger.info "Typing #{element.attribute("value")}"
  rescue
  end

  def before_quit(driver)
    $logger.info "Quitting browser"
  rescue
  end

  def before_close(driver)
    $logger.info "Closing Window"
  rescue
  end
end