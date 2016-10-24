class CaptchaPopup < PageObject

  @box_container = WebElement.new('.Modal-dialog')
  @captcha = WebElement.new({class: "recaptcha-checkbox-checkmark"}, nil, WebElement.new("iframe"))
  @captcha_challenge = WebElement.new({class: 'rc-imageselect-payload'}, nil, WebElement.new("iframe[title='recaptcha challenge']"))
  @cancel_btn = WebElement.new(".js-cancel-button")
  @download_btn = WebElement.new(".js-download-datasheet")

  def verify_captcha_triggered
    @box_container.verify_visible
    @download_btn.verify_visible
      @captcha.click
      @captcha_challenge.verify_visible

  end

end