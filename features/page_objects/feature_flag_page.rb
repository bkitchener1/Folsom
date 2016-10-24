class FeatureFlagSection < PageObject
  @flag_button = WebElement.new("button")
  @flag_label = WebElement.new("td:nth-child(0)")
  @enabled_label = WebElement.new("td:nth-child(1)")
end

class FeatureFlagPage < AdminInstrumentsPage
  @page_url = "#{$base_url}/admininstruments/toggles/"

  def flag_row_elem(flag_name)
    locator = {:xpath=>"//tr[./td[contains(text(),'#{flag_name}')]]"}
    element = WebElement.new(locator)
    parent_elem = FeatureFlagSection.new(locator, element)
  end

  def click_on_flag(flag_name)
    $logger.info "Clicking #{flag_name}"
    flag_row_elem(flag_name).flag_button.click
  end

  def get_flag_btn_text(flag_name)
    row = flag_row_elem(flag_name)
    row.flag_button.text
  end

  def set_flag(flag_name, change_to_flag_state)
    button_activity = get_flag_btn_text(flag_name)
    if button_activity.downcase == change_to_flag_state.downcase
      $logger.info "Setting Feature Flag #{flag_name} to be #{change_to_flag_state}"
      click_on_flag(flag_name)
      flag_row_elem(flag_name).flag_button.verify_text_not(change_to_flag_state)
    end

  end

  def change_flag(flag_name, flag_state)
    if not self.flag_row_elem(flag_name).exists?
      $logger.info ("WARNING: The Flag #{flag_name} could not be found")
      return
    end
    $logger.info "Setting #{flag_name} to #{flag_state}"
    self.set_flag(flag_name, flag_state)
  end



end