
class Currency < PageObject
  @currency_name = WebElement.new({:class => 'HeaderDropdown-list-item-name'})
  @currency_symbol = WebElement.new({:class => 'HeaderDropdown-list-item-symbol'})
  @currency_value = WebElement.new({:class => 'HeaderDropdown-list-item-value'})
end

class NewCurrency < PageObject
  @currency_name = WebElement.new('.HeaderDd-list-item-name')
  @currency_symbol = WebElement.new('.HeaderDd-list-item-symbol')
end

class CurrencyCodeDropDown < PageObject
  @currency_drop_down = WebElement.new(:class => 'HeaderDropdown--currency')
  @new_currency_drop_down = WebElement.new('.HeaderDd-wrap.HeaderDd-currency')
  @default_currency_symbol = WebElement.new(:class => 'NavIcons-item--dropdown-symbol')
  @selected_symbol = WebElement.new('.HeaderDd-list-item.is-active .HeaderDd-list-item-symbol')
  @selected_currency_description = WebElement.new('.HeaderDd-list-item.is-active .HeaderDd-list-item-name')
  @current_currency_description = WebElement.new(:class => 'NavIcons-item--dropdown-name')
  @currency_codes = Currency.new('.HeaderDropdown-list-item')
  @new_currency_codes = NewCurrency.new('.HeaderDd-list-item')
  @selected_currency_code = Currency.new('.HeaderDropdown-list-item.is-active',@currency_codes)
  @currency_code = WebElement.new(['#header-currency,#ar-currency-holder'])

  def get_selected_symbol(text)
    @selected_symbol.verify_text"#{text}"
  end

  def get_selected_description(text)
    @selected_currency_description.verify_text"#{text}"
  end


  def verify_currency_drop_down_not_visible
    @new_currency_drop_down.verify_not_visible
  end

  def verify_currency_drop_down_visible
    @new_currency_drop_down.verify_visible
  end

  def

  def get_selected_currency
    @selected_currency_code
  end

  def is_currency_code_visible
    @currency_code.displayed?
  end

  def is_currency_code_drop_down_visible
    @currency_drop_down.displayed?
  end

  def click_on_currency_code
    @currency_code.click
  end

  def currency_code_text
    @currency_code.text
  end

  def change_currency(currency_code = 'AUD')
    codes = @currency_codes
    code = codes.first.html
    @currency_codes.where(:text, currency_code).first.click
  end

  def currency_changed?(currency_code = 'AUD')
    currency_selected_before = self.current_currency_description
    self.change_currency(currency_code)
    current_currency_description != currency_selected_before
  end

  def currency_is?(expected_currency_code = 'AUD')
    current_currency_description == expected_currency_code
  end

end
