class CountryItem < PageObject
    @flag = WebElement.new('span>i')
    @name = WebElement.new('span>div')
    @phone = WebElement.new('span>span')
end


class ContactUsPage < PageObject

  @contact_us_body_heading = WebElement.new(".ContactUs-heading--main")
  @contact_us_by_phone = WebElement.new(".ContactUs-link>.Icon--phone")
  @contact_us_by_email = WebElement.new(".ContactUs-link>.Icon--email")
  @customer_support_btn = WebElement.new(".ContactUs-buttons>.Chat-button")
  @online_chat_btn = WebElement.new("div[data-panel='chat']")
  @feedback_button = WebElement.new(".js-feedback")
  @region_sections = WebElement.new(".Region")
  @country_items = CountryItem.new(".Region-item")
  @page_url = "#{$base_url}/#{FigNewton.contact_us_page}"

  def no_of_region_sections
    @region_sections.count
  end

  def visit_default_page
    $driver.get "#{$base_url}/#{FigNewton.contact_us_page}"
  end

  def contact_email_present
    @contact_us_by_email.verify_present
  end

  def customer_sup_btn_present
    @customer_support_btn.verify_present
  end

  def online_chat_btn_present
    @online_chat_btn.verify_present
  end

  def feedback_btn_present
    @feedback_button.verify_present
  end

  def contact_phone_present
    @contact_us_by_phone.verify_present
  end

  def contact_heading_verify_text(text)
    @contact_us_body_heading.verify_text "#{text}"
  end

  def get_num_of_countries
    @country_items.count
  end

  def country_name_present(num)
    @country_items[num].name.verify_present
  end

  def country_phone_number_present(num)
    @country_items[num].name.verify_present
  end

  def country_flag_present(num)
    @country_items[num].flag.verify_present
  end

end