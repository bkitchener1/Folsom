require_relative 'webdriver'

class BrowserSession
  def initialize(browser="chrome", host="local", os="any", os_version="", browser_version="", device='', name="")
    @browser = browser
    @host = host
    @os = os
    @os_version = os_version
    @browser_version = browser_version
    @name = name
    @device = device
    @listener = NavigationListener.new
  end

  def launch_remote_browser()
    $logger.info "Starting remote #{@browser} browser at #{@host}"
    caps = get_caps_for_browser
    Selenium::WebDriver.for :remote, :url => remote_endpoint, :desired_capabilities => caps, :listener=>@listener
  end

  def launch_local_browser()
    $logger.info "Starting local #{@browser} browser"
    Selenium::WebDriver.for(@browser.to_sym,:listener=>@listener)
  end

  def launch_sauce_browser()
    $logger.info "Starting SauceLabs #{@browser} browser"
    caps = get_caps_for_browser
    Selenium::WebDriver.for :remote, :url => sauce_endpoint, :desired_capabilities => caps, :listener=>@listener
  end

  def launch_browserstack_browser()
    $logger.info "Starting BrowserStack Browser: #{@browser} #{@browser_version} on os: #{@os} version: #{@os_version}"
    start_browserstack_local
    caps = Selenium::WebDriver::Remote::Capabilities.new
    caps['browser'] = @browser
    caps['browser_version'] = @browser_version
    caps['os'] = @os
    caps['os_version'] = @os_version
    caps['name'] = @name
    caps['resolution'] = '1600x1200'
    caps['browserstack.local'] = true
    Selenium::WebDriver.for :remote, :url => browserstack_endpoint, :desired_capabilities => caps, :listener=>@listener
  end

  def launch_browserstack_device
    $logger.info "Starting BrowserStack Device: #{@device}"
    caps = Selenium::WebDriver::Remote::Capabilities.new
    caps[:browserName] = 'iPhone'
    caps[:platform] = 'MAC'
    caps['device'] = 'iPhone 5'
    caps['os_version'] = '8.3'
    Selenium::WebDriver.for :remote, :url => browserstack_endpoint, :desired_capabilities => caps, :listener=>@listener

  end

  def launch_browser()
    if @host == "sauce"
      @driver = launch_sauce_browser
    elsif @host == "browserstack"
      if @device == ''
        @driver = launch_browserstack_browser
      else
        @driver = launch_browserstack_device
      end
    elsif @host != "localhost"
      @driver = launch_remote_browser
    else
      @driver = launch_local_browser
    end
    resize_browser
    @driver.manage.timeouts.implicit_wait = 1
    @driver.manage.timeouts.page_load = $page_timeout
    @driver
  end

  def resize_browser
    $logger.info "Resizing browser to #{$size} size"
    case $size
        when 'mobile'
          @driver.resize_viewport(327, 600)
        when 'phablet'
          @driver.resize_viewport(600, 900)
        when 'tablet'
          @driver.resize_viewport(720, 900)
        when 'desktop'
          @driver.resize_viewport(1025, 900)
        when 'wide'
          @driver.resize_viewport(1240, 1080)
        when 'max'
          @driver.manage.window.maximize
    end
  end

  def get_caps_for_browser()
    if @browser.downcase == "chrome"
      caps = Selenium::WebDriver::Remote::Capabilities.chrome()
    elsif @browser.downcase == "firefox"
      caps = Selenium::WebDriver::Remote::Capabilities.firefox()
    elsif @browser.downcase == "ie"
      caps = Selenium::WebDriver::Remote::Capabilities.ie()
      caps["acceptSslCerts"] = true
      caps["ignoreProtectedModeSettings"] = true
      caps["ie.ensureCleanSession"] = true
    elsif @browser.downcase == "safari"
      caps = Selenium::WebDriver::Remote::Capabilities.safari()
    elsif @browser.downcase == "iphone"
      caps = Selenium::WebDriver::Remote::Capabilities.iphone()
    elsif @browser.downcase == "ipad"
      caps = Selenium::WebDriver::Remote::Capabilities.ipad()
    end
    caps
  end

  def start_browserstack_local
    $logger.info "Starting BrowserStack local"
    if $environment == "browserstack" and not defined? $browserstack_local
      $logger.info "Starting BrowserStackLocal"
      $browserstack_local = fork do
        file_dir = File.join(File.dirname(__FILE__),'BrowserStackLocal')
        api_key = FigNewton.browserstack_api_key
        exec "'#{file_dir}' #{api_key} -force"
      end
    end
  end

  def stop_browserstack_local
    if $environment == "browserstack" and not defined? $browserstack_local
      Process.kill 0, $browserstack_local
    end
  end

  def remote_endpoint
    "http://#{@host}:4444/wd/hub"
  end

  def sauce_endpoint
    "http://bkitchener1:c479e821-57e7-4b3f-8548-48e520585187@ondemand.saucelabs.com:80/wd/hub"
  end

  def browserstack_endpoint
    "http://briankitchener1:WdEWTk9pUjdsttLheZ9H@hub.browserstack.com/wd/hub"
  end

end