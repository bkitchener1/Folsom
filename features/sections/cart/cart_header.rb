class CartHeader < PageObject
    @logo = WebElement.new(".ar-navbar-brand")
    @phone_number = WebElement.new(".phone")
    @live_support = WebElement.new("#header-chat")
    @language = WebElement.new("a[title='Change Language']")
    @currency = WebElement.new(".ar-currency-holder")
    @user_icon= WebElement.new("a[title*='Log in or out']>div")
    @cart = WebElement.new(".ar-cart-holder")
    @cart_red_dot = WebElement.new(".u-dot")
    @logout = WebElement.new("a[title=Logout]")
    @view_cart_btn= WebElement.new("a[name=viewCartLink]")
    @silicon_labs_image= WebElement.new("img[src='/~/media/arrow/externalcart/vendor-logo/siliconlabs.png?mw=99&hash=69DB46E5BA6317F775E1CCD2EE9CE1F58F45C8B1']")

  def verify_visible()
    @logo.verify_visible
    if $size == "desktop"
      @phone_number.verify_visible
      @cart.verify_visible
      @live_support.verify_visible
      @language.verify_visible
      @currency.verify_visible
      @user_icon.verify_visible
    else
      @live_support.verify_visible
      @language.verify_visible
      @currency.verify_visible
      @user_icon.verify_visible
    end
  end

    def verify_visible_po
        @live_support.verify_visible
        @language.verify_visible
        @currency.verify_not_visible
        @user_icon.verify_visible
      end

  def logout
    @user_icon.click
    @logout.click
  end

  def verify_logged_in
    @user_icon.click
    @logout.verify_visible
  end

  def verify_not_logged_in
    @user_icon.verify_not_visible
  end

  def switch_language(language)
    @language.click
    if language == "german"
      @lang_element= WebElement.new(".language-dropdown>div:nth-child(2)")
    elsif language == "chinese"
      @lang_element= WebElement.new(".language-dropdown>div:nth-child(3)")
    elsif language == "english"
      @lang_element= WebElement.new(".language-dropdown>div:nth-child(1)")
    elsif language == "french"
      @lang_element= WebElement.new(".language-dropdown>div:nth-child(4)")
    elsif language== "italian"
      @lang_element= WebElement.new(".language-dropdown>div:nth-child(5)")
    elsif language== "spanish"
      @lang_element= WebElement.new(".language-dropdown>div:nth-child(6)")
    end
    @lang_element.click
  end

  def click_view_cart_btn
    @view_cart_btn.click
  end

  def silicon_image_present
    @silicon_labs_image.present?
  end

  def open_language
    @language.click
  end
end
