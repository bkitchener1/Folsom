class PaypalPage < PageObject
  @frame= WebElement.new(:name => 'injectedUl')
  @username= WebElement.new(:css=>"#email")
  @password= WebElement.new(:css=>"#password")
  @login= WebElement.new(:css=>"#btnLogin")
  @pay= WebElement.new(:css=>"#confirmButtonTop")


  def login(username, password)
    wait_until{
      $driver.window_handles.length > 1
    }
    $driver.switch_to.window( $driver.window_handles.last )
    @frame.verify_present(120)
    $driver.switch_to.frame "injectedUl"
    @username.send_keys(username)
    @password.send_keys(password)
    @login.click
  end

  def pay
    @pay.click
    $driver.switch_to.window( $driver.window_handles.first )
  end
end
