class LanguageSelector < PageObject

  @language_selector = WebElement.new('#header-language>a')
  @language_drop_down = WebElement.new('.HeaderDropdown--language')
  @language_list_items = WebElement.new('.LinkList-item',@language_drop_down)
  @selected_language = WebElement.new('.LinkList-item.is-active')
  # selector was not working
  @selected_language = WebElement.new("a[href='#']")
  @displayed_language = WebElement.new('.NavIcons-dropdown-name')

  def language(code)
    # language_drop_down_element.span_element(:text => code)
    @languages.select {|lang_link| lang_link.text == code}.first
  end

  def change_site_language_to(locale_code)
    @language_selector.click
    WebElement.new("a[href*=#{locale_code}]").verify_visible.click
  end
end
