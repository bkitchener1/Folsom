class Header < PageObject
  @header = WebElement.new(:class => 'Head')
  @divisions_btn = WebElement.new(:class => 'NavIcons-item--divisions-text')

  @login_link = WebElement.new("#header-login")
  @my_arrow_link = WebElement.new('.header-myArrowTM-link')
  @my_arrow_mobile= WebElement.new('.Icon-my-arrow-tm')
  @minimized_header = WebElement.new('.has-minimised-header')
  @divisions_menu = WebElement.new('div.DivisionsMenu')
  @header_search_input = WebElement.new(:id => 'header-searchInput')
  @header_search_input_info = WebElement.new(:class => 'Header-search-input-placeholder')
  @mobile_search_icon = WebElement.new(['.NavIcons-item--mobileSearch span', '.Embedded-search-button'])
  @phone_icon = WebElement.new(:class => 'Icon--phone')
  @phone = WebElement.new(:class => 'NavIcons-phone')
  @live_chat = WebElement.new(:id => 'header-chat')
  @body = WebElement.new('body')
  @megamenu = WebElement.new(:class => 'Megamenu-nav')
  @megamenu_items = WebElement.new(class: 'Megamenu-panel')
  @my_account = WebElement.new('.Icon--little-man')
  @ad_banner = WebElement.new('.AdBanner-image>h2')
  @megamenu_headers = WebElement.new(".u-header2Small")
  @cart_icon= WebElement.new(".Icon--shopping-cart")
  @language= WebElement.new("a[title=Language]")
  @currency= WebElement.new("a[title=Currency]")
  @arrow_logo= WebElement.new(".Logo--base")
  @phone_text= WebElement.new(".Phone-text")
  @man_icon= WebElement.new(".Icon--little-man")
  @user_dropdown= WebElement.new("#header-loggedIn>div")
  @my_projects= WebElement.new("a[href='/en/design-center/my-projects']")
  @order_history= WebElement.new("a[href='/en/my-account/order-history']")
  @password_change= WebElement.new("a[href='https://qa.components.arrow.com/federationregistrationservice/fed_password.jsp']")
  @profile_settings= WebElement.new("a[href='https://qa.components.arrow.com/federationregistrationservice/fed_maint.jsp']")
  @user_loggedin= WebElement.new(".UtilityLinks-loggedInUser-text")
  #megamenu items
  @new_products = WebElement.new('.Megamenu-list-item-link-highlight')

  @products = WebElement.new('a[data-panel=products]')
  @datasheets= WebElement.new('a[data-panel=datasheets]')
  @reference_designs= WebElement.new('a[data-panel=referencedesigns]')
  @research_and_events= WebElement.new('a[data-panel=researchandevents]')
  @design_center= WebElement.new('a[data-panel=designcenter]')

  #search bar
  @header_search = WebElement.new(:class => 'Header-search')
  @search_mag_glass_icon = WebElement.new(:class => 'Icon--mag-glass')
  @search_text = WebElement.new(:class => 'Header-search-input-placeholder--search')
  @search_default_text = WebElement.new(:class => 'Header-search-input-placeholder--search-info')
  @search_bar_search_button = WebElement.new(:class => 'Embedded-search-submit')
  @mega_menu_channel_links = WebElement.new(:class => 'Megamenu-list-item-link')
  @megamenu_container = WebElement.new(class: 'Megamenu-panel')
  @section_header_link = WebElement.new('.u-header2Small>a')
  @megamenu_list_item = WebElement.new('.Megamenu-list-item-link-text')
  @megamenu_list_pullout = WebElement.new(class: 'Megamenu-list-item-link')
  @search_header= WebElement.new(".Search-bar")
  @desktop_search_bar= WebElement.new(".Search-text--tabletDesktop")

  #hamburger menu
  @hamburger_menu_overlay= WebElement.new(".mobile-dropdown.overlay")
  @hamburger_menu_closed= WebElement.new(".hamburger-box")
  @hamburger_close_icon= WebElement.new(".hamburger-box.cross-box")
  @mobile_my_arrow= WebElement.new("a[href='/en/arrow-services/myarrow']")
  @ham_login= WebElement.new("a[title=Login]")
  @logged_in= WebElement.new('div[title="My Account"]')
  @english= WebElement.new(".HeaderDd--language>ul>li:nth-child(1)>a")
  @german= WebElement.new(".HeaderDd--language>ul>li:nth-child(2)>a")
  @chinese= WebElement.new(".HeaderDd--language>ul>li:nth-child(3)>a")
  @ham_currency_open= WebElement.new(".HeaderDd-currency")
  @phone_num= WebElement.new(".TopLinksDropdown-contactUsText")
  @live_support= WebElement.new(".NavIcons-chatText")
  @mobile_search_bar= WebElement.new(".Search-text--mobile")


  #arrow divisions
  @arrow_divisions_tab= WebElement.new(".js-division-dropdown")
  @divisions_header_text= WebElement.new(".DivisionsMenu-cell-subtitle")
  @divisions_menu_expanded= WebElement.new(class: 'DivisionsMenu')
  @division_category_grid= WebElement.new(".DivisionsMenu-cell-wrap")
  @computing_solutions= WebElement.new("a[href='/en/divisions/computing-solutions']")
  @electronic_components= WebElement.new("a[href='/en/divisions/electronic-components")
  @oem_computing= WebElement.new("a[href='/en/divisions/oem-computing-solutions")
  @arrow_value_recovery= WebElement.new("a[href='/en/divisions/arrow-value-recovery")


  def channel_link(link_text)
    @megamenu_list_item.where(:text, link_text).parent
  end

  def trigger_pullout_menu_for(channel_url)

    @megamenu_list_pullout.each { |item| item.hover if item.attribute('href') =~ /#{channel_url}/ }
  end

  def verify_menu_has_link (link)
    @megamenu_list_pullout.where("href", link).verify_visible
  end

  def get_links_of_section(section_elem)
    WebElement.new('li.NewList-Item>a', section_elem)
  end

  def get_channel_link_using_data_panel(channel_data_name)
    @mega_menu_channel_links.select { |channel_elem| channel_elem.attribute('data-panel') == channel_data_name }.first
  end

  def get_all_section_header_links
    @section_header_links.collect { |header| header.attribute("href") }
  end


  def is_header_is_displayed
    @header.displayed?
  end

  def is_telephone_icon_present
    @phone_icon.displayed?
  end

  def open_divisions_menu
    sleep(3)
    @divisions_btn.click
  end

  def products_count_for_channel(data_panel_value)
    count = get_channel_link_using_data_panel(data_panel_value).span_element(:class => 'Megamenu-list-item-link-highlight').text
    count.gsub(',', '').to_i
  end

  def hover_over_channel(channel_data_name)
    channel_link = get_channel_link_using_data_panel(channel_data_name)
    channel_link.hover
  end

  def click_design_center
    @design_center.click
  end

  def verify_new_header
    if $size == "tablet"
      @ham_login.verify_visible
      @cart_icon.verify_visible
      @arrow_logo.verify_visible
      @hamburger_menu_closed.verify_visible
      @mobile_search_icon.verify_visible
      @desktop_search_bar.verify_visible
      @mobile_my_arrow.verify_visible
      @live_chat.verify_not_visible
      @phone.verify_not_visible
      @divisions_btn.verify_not_visible
      @language.verify_not_visible
      @currency.verify_not_visible
    elsif $size == "mobile"
      @cart_icon.verify_visible
      @arrow_logo.verify_visible
      @hamburger_menu_closed.verify_visible
      @mobile_search_icon.verify_visible
      @mobile_search_bar.verify_visible
      @live_chat.verify_not_visible
      @phone.verify_not_visible
      @divisions_btn.verify_not_visible
      @language.verify_not_visible
      @currency.verify_not_visible
      @ham_login.verify_not_visible
      @mobile_my_arrow.verify_not_visible
    elsif $size == "desktop"
      @cart_icon.verify_visible
      @arrow_logo.verify_visible
      @hamburger_menu_closed.verify_visible
      @mobile_search_icon.verify_visible
      @desktop_search_bar.verify_visible
      @live_chat.verify_visible
      @phone.verify_visible
      @divisions_btn.verify_visible
      @language.verify_visible
      @currency.verify_visible
      @ham_login.verify_visible
      @mobile_my_arrow.verify_visible
    end
  end

  def verify_hamburger_menu
    if $size== "tablet"
      @ham_login.verify_visible
      @cart_icon.verify_visible
      @arrow_logo.verify_visible
      @hamburger_close_icon.verify_visible
      @hamburger_menu_overlay.verify_visible
      @products.verify_visible
      @datasheets.verify_visible
      @reference_designs.verify_visible
      @research_and_events.verify_visible
      @design_center.verify_visible
      @live_chat.verify_visible
      @language.verify_visible
      @currency.verify_visible
      @phone_num.verify_text("1-855-326-4757")
      @mobile_my_arrow.verify_visible
    elsif $size== "mobile"
      @cart_icon.verify_visible
      @arrow_logo.verify_visible
      @hamburger_close_icon.verify_visible
      @hamburger_menu_overlay.verify_visible
      @products.verify_visible
      @datasheets.verify_visible
      @reference_designs.verify_visible
      @research_and_events.verify_visible
      @design_center.verify_visible
      @live_chat.verify_visible
      @language.verify_visible
      @currency.verify_visible
      @phone_num.verify_text("1-855-326-4757")
      @ham_login.verify_visible
      @mobile_my_arrow.verify_visible
    end
  end

  def verify_header_arrow
    if $size == "desktop"
      @my_arrow_link.verify_visible
      @login_link.verify_visible
      @phone_icon.verify_visible
      @phone_text.verify_text("1-855-326-4757")
      @arrow_logo.verify_visible
      @language.verify_visible
      @currency.verify_visible
      @divisions_btn.verify_visible
      @live_chat.verify_visible
      @cart_icon.verify_visible
      @login_link.verify_visible
    elsif $size == "mobile"
      @arrow_logo.verify_visible
      @search_mag_glass_icon.verify_visible
      @login_link.verify_visible
      @cart_icon.verify_visible
      @phone_icon.verify_not_visible
      @phone_text.verify_not_visible
      @divisions_btn.verify_not_visible
      @live_chat.verify_not_visible
      @currency.verify_not_visible
      @language.verify_not_visible
      @my_arrow_link.verify_not_visible
    elsif $size == "tablet"
      @arrow_logo.verify_visible
      @search_mag_glass_icon.verify_visible
      @my_arrow_link.verify_visible
      @login_link.verify_visible
      @cart_icon.verify_visible
      @phone_icon.verify_not_visible
      @phone_text.verify_not_visible
      @divisions_btn.verify_not_visible
      @live_chat.verify_not_visible
      @currency.verify_not_visible
      @language.verify_not_visible
    end
  end

  def verify_logged_in_arrow
    if $size == "desktop"
      @my_arrow_link.verify_visible
      @phone_icon.verify_visible
      @phone_text.verify_text("1-855-326-4757")
      @arrow_logo.verify_visible
      @language.verify_visible
      @currency.verify_visible
      @divisions_btn.verify_visible
      @live_chat.verify_visible
      @cart_icon.verify_visible
      @login_link.verify_not_visible
      @man_icon.verify_visible
    elsif $size == "mobile"
      @arrow_logo.verify_visible
      @search_mag_glass_icon.verify_visible
      @cart_icon.verify_visible
      @phone_icon.verify_not_visible
      @phone_text.verify_not_visible
      @divisions_btn.verify_not_visible
      @live_chat.verify_not_visible
      @currency.verify_not_visible
      @language.verify_not_visible
      @my_arrow_link.verify_not_visible
      @login_link.verify_not_visible
      @man_icon.verify_visible
    elsif $size == "tablet"
      @arrow_logo.verify_visible
      @search_mag_glass_icon.verify_visible
      @my_arrow_link.verify_visible
      @cart_icon.verify_visible
      @phone_icon.verify_not_visible
      @phone_text.verify_not_visible
      @divisions_btn.verify_not_visible
      @live_chat.verify_not_visible
      @currency.verify_not_visible
      @language.verify_not_visible
      @login_link.verify_not_visible
      @man_icon.verify_visible
    end
  end

  def click_link_hamburger(link)
    if link == "Products"
      @products.click
    elsif link == "Datasheets"
      @datasheets.click
    elsif link == "Reference Designs"
      @reference_designs.click
    elsif link == "Research and Events"
      @research_and_events.click
    elsif link == "Design Center"
      @design_center.click
    elsif link == "Login"
      @ham_login.click
    elsif link == "MyArrow"
      @mobile_my_arrow.click
    elsif link == "Live Support"
      @live_chat.click
    elsif link == "Language"
      @language.click
    elsif link == "Currency"
      @currency.click
    elsif link == "Cart"
      @cart_icon.click
    end
  end

  def verify_ham_language
    @english.verify_text "English"
    @german.verify_text "Deutsch"
    @chinese.verify_text "简体中文"
  end

  def verify_ham_currency_dropdown
    @ham_currency_open.verify_visible
  end

  def verify_user_logged_in
    if $size == "tablet"
      @logged_in.verify_text "Hello"
    elsif $size == "mobile"
      @hamburger_menu_closed.click
      @logged_in.verify_text "Hello"
    end
  end

end

