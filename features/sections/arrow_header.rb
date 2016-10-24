
class ArrowHeader < PageObject
  @logo = WebElement.new({:css=>".Logo"})
  @arrow_division = WebElement.new({:class=>"NavIcons-item--arrow-text" })
  @phone = WebElement.new({:class=>"Phone-text"})
  @live_support = WebElement.new({:class=>"Icon--chat"})
  @language = WebElement.new({:class=>"NavIcons-item--dropdown--name"})
  @currency = WebElement.new({:css=>"a[title*=Currency]"})
  @my_arrow = WebElement.new({:class=>"Icon--my-arrow-tm" })
  @login_register = WebElement.new({:css=>"#header-login>a"})
  @avatar = WebElement.new({:css=>"#header-loggedIn>a"})
  @cart = WebElement.new({:css=>"#header-cart>a"})
  @view_cart = WebElement.new({:css=>".MyCart-view>a"})
  @logout = WebElement.new({:css=>"a[href*=logout]"})
  @mobile_search = WebElement.new({:css=>".NavIcons-item--mobileSearch"})
  @mobile_arrow = WebElement.new({:css=>".Megamenu-mobileArrow"})
  @products = WebElement.new({:css=>"a[data-panel=products]"})
  @datasheets = WebElement.new({:css=>"a[data-panel=datasheets]"})
  @reference_designs = WebElement.new({:css=>"a[data-panel=referencedesigns]"})
  @research_events = WebElement.new({:css=>"a[data-panel=researchandevents]"})
  @design_center = WebElement.new({:css=>"a[data-panel=designcenter]"})
  @search = WebElement.new({:id=>"header-searchInput"})

  def change_language(language)
    @language.click
    if language == "German"
      language_text = "Deutsch"
    elsif language == "Chinese"
      language_text = "简体中文"
    elsif language == "English"
      language_text = "English"
    end
    language_element = WebElement.new(:link_text=>language_text)
    language_element.click
  end

  def verify_visible()
    if $size=="mobile"
      @logo.where(:text, "something")
      @logo.verify_visible
      @mobile_search.verify_visible
      @login_register.verify_visible
      @cart.verify_visible
      @datasheets.verify_visible
      @reference_designs.verify_visible
      @products.verify_visible
      @mobile_arrow.verify_visible
    elsif $size=="tablet"
      @logo.verify_visible
      @mobile_search.verify_visible
      @my_arrow.verify_visible
      @login_register.verify_visible
      @cart.verify_visible
      @datasheets.verify_visible
      @reference_designs.verify_visible
      @products.verify_visible
      @research_events.verify_visible
      @design_center.verify_visible
    else
      @logo.verify_visible
      @arrow_division.verify_visible
      @phone.verify_visible
      @live_support.verify_visible
      @language.verify_visible
      @currency.verify_visible
      @my_arrow.verify_visible
      @login_register.verify_visible
      @cart.verify_visible

      @products.verify_visible
      @datasheets.verify_visible
      @reference_designs.verify_visible
      @research_events.verify_visible
      @design_center.verify_visible
      @search.verify_visible
    end
  end

  def verify_logged_in
    @avatar.verify_visible(60)
  end

  def is_logged_in?
    @avatar.displayed?
  end

  def logout
    @avatar.verify_visible.click
    @logout.verify_visible.click
  end

  def select_currency(type)
    @currency.verify_visible.click
    element = WebElement.new(:xpath => "//*[contains(text(),'#{type}')]")
    element.click
  end

  def verify_currency(type)
    @currency.verify_text(type)
  end

end