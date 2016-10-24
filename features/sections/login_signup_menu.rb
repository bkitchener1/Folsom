class LoginSignupMenu < PageObject
  @login_btn = WebElement.new("a[title=Login]")
  @register_btn = WebElement.new('a[href*=myArrow]')
end
