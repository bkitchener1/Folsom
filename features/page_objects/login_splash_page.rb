class LoginSplashPage < PageObject


  # splash page locators
  @page_url = $base_url + "#{FigNewton.login_splash_page_url}"
  @page_content = WebElement.new("div[id='main-content'] ")
  @login_splash_section_header = WebElement.new(".LoginSplash-sectionHeader")
  @login_splash_section_sub_header = WebElement.new(".LoginSplash-subheader")
  @login_splash_section_preferred_pricing = WebElement.new(".LoginSplash--preferredpricing")
  @login_splash_section_global_inventory = WebElement.new(".LoginSplash--globalinventory")
  @login_splash_region_text = WebElement.new(".LoginSplash--preferredpricing>p")
  @login_splash_region_selector = WebElement.new(".LoginSplash-select")
  @go_to_my_arrow_button = WebElement.new(:css=>".LoginSplash-myArrow")
  @go_to_arrow_com_button = WebElement.new(:css=>".LoginSplash-arrowCom")

  #locators for logged-in
  @little_man_icon = WebElement.new(".Icon--little-man")
  @myarrow_loggedin= WebElement.new("#header-loggedIn")
  @myarrow_loggedin_title =WebElement.new('.HeaderDropdown-title')
  @logout_button =WebElement.new("a[href='/en/endpoints/logout?originUrl=']")


  def verify_login_splash_page
    page_url = $base_url + "#{FigNewton.login_splash_page_url}"
    $driver.verify_url"#{page_url}"
    @page_content.verify_present
    @login_splash_section_header.verify_present
    @login_splash_section_header.verify_text(value="We noticed that you have a MyArrow account")
    @login_splash_section_sub_header.verify_present
    @login_splash_section_preferred_pricing.verify_present
    @login_splash_section_global_inventory.verify_present
  end


  def verify_login_links
    @go_to_my_arrow_button.verify_present
    @go_to_arrow_com_button.verify_present
  end

   def verify_region_selector
     @login_splash_region_text.verify_present
     @login_splash_region_selector.verify_present
   end

   def select_region(region)
     @login_splash_region_selector.click
     @login_splash_region_selector.select_by(:value,region)
   end

  def verify_region(region_selected)
    $driver.verify_url("#{FigNewton.region_url}#{region_selected}")
  end

  def verify_logged_in
    $driver.verify_url(FigNewton.base_url)
    @little_man_icon.click
    @myarrow_loggedin.verify_present
    @myarrow_loggedin_title.verify_text(FigNewton.myArrowUsertext)
    @logout_button.verify_present
  end

  end