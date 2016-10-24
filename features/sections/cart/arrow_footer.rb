class ArrowFooter < PageObject
  @logo = WebElement.new("footer .Logo--white")
  @about_intro = WebElement.new(".Footer-about-intro")
  @about_text = WebElement.new(".Footer-about-text")
  @read_more = WebElement.new(".Footer-about-readMore")
  @twitter = WebElement.new(".Icon--twitter")
  @youtube = WebElement.new(".Icon--youtube")
  @facebook = WebElement.new(".Icon--facebook")
  @linkedin = WebElement.new(".Icon--linkedin")
  @google_plus = WebElement.new(".Icon--google-plus")
  @newsletter = WebElement.new("div[data-panel=newsletter]")
  @chat_with_us_live = WebElement.new(".Footer-contact-chat-tab")
  @subscribe = WebElement.new(".Footer-newsletter-anchor")
  @about_arrow = WebElement.new(".Footer-links-item>a[href*=about-arrow]")
  @contact_us= WebElement.new(".Footer-links-item>a[href*=contact-us]")

  def verify_visible
    @logo.verify_visible
    @about_intro.verify_visible
    @about_text.verify_visible
    @read_more.verify_visible
    @twitter.verify_visible
    @youtube.verify_visible
    @facebook.verify_visible
    @linkedin.verify_visible
    @google_plus.verify_visible
    @newsletter.verify_visible
    @chat_with_us_live.verify_visible
    @subscribe.verify_visible
    @about_arrow.verify_visible
  end

  def verify_not_visible
    @logo.verify_not_visible
    @about_intro.verify_not_visible
    @about_text.verify_not_visible
    @read_more.verify_not_visible
    @twitter.verify_not_visible
    @youtube.verify_not_visible
    @facebook.verify_not_visible
    @linkedin.verify_not_visible
    @google_plus.verify_not_visible
    @newsletter.verify_not_visible
    @chat_with_us_live.verify_not_visible
    @subscribe.verify_not_visible
    @about_arrow.verify_not_visible
  end
end