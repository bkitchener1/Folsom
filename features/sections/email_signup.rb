class EmailSignup < PageObject

    @sign_up_module = WebElement.new(:class => 'SignUpModule')
    @sign_up_form = WebElement.new(:class => 'SignUpModule-form')
    @sign_up_icon = WebElement.new(:class => 'Icon--envelope')
    @email_text_field = WebElement.new(:id => 'SignUpModule-email')
    @sign_up_btn = WebElement.new('.Button', @sign_up_module)
end