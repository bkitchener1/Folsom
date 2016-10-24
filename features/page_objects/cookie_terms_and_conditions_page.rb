class CookieTermsAndConditionsPage < PolicyPage

  @page_url = "#{$base_url}/legal/cookie-policy"

  def is_selected?
    @selected_sidebar_option.href.match /cookie-policy/
  end

end