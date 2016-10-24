class AdminInstrumentsPage < PageObject

  @page_url = "#{FigNewton.base_url}/Admininstruments/"

  @toggles_page_link = WebElement.new(href: /toggles/)
  @username = WebElement.new(id: 'Username')
  @password = WebElement.new(:id => 'Password')
  @login_btn = WebElement.new('.button')

  def login_as_admin
    # return true unless login_btn.exists?
    @username.send_keys(FigNewton.sitecore_username)
    @password.send_keys(FigNewton.sitecore_password)
    @login_btn.click
  end

  def login_as_user1
    # return true unless login_btn.exists?
    @username.send_keys(FigNewton.sitecore_user1)
    @password.send_keys(FigNewton.sitecore_pass)
    @login_btn.click
  end

  def login_as_user2
    # return true unless login_btn.exists?
    @username.send_keys(FigNewton.sitecore_user2)
    @password.send_keys(FigNewton.sitecore_pass)
    @login_btn.click
  end

  def login_as_user3
    # return true unless login_btn.exists?
    @username.send_keys(FigNewton.sitecore_user3)
    @password.send_keys(FigNewton.sitecore_pass)
    @login_btn.click
  end

  def login_as_user4
    # return true unless login_btn.exists?
    @username.send_keys(FigNewton.sitecore_user4)
    @password.send_keys(FigNewton.sitecore_pass)
    @login_btn.click
  end

end