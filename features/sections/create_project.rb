class CreateProject < PageObject
  @create_project_form = WebElement.new(:class => 'CreateProjectModal-createForm')
  @project_name_input = WebElement.new(:id => 'CreateProjectModal-nameInput')
  @create_project_btn = WebElement.new({:class => 'CreateProjectModal-createButton'},@create_project_form)
  @promo_create_proj_btn = WebElement.new('#designCenter-my-projects>.js-createProject')

  @create_project_error = WebElement.new(:class => 'CreateProjectModal-errorMessage')

  #for not Logged in user
  @login_modal_parent = WebElement.new(:class => 'LoginModal')
  @login_modal_login_btn = WebElement.new(".Modal-button-login")
  @login_modal_register_btn = WebElement.new(".Modal-button-register")

  def generate_random_project_name(project_name)
    curr_date = Time.now
    "#{project_name}_#{curr_date.day}_#{curr_date.month}_#{curr_date.year}_#{rand(100)}"
  end

  def create_new_project(project_name)
    @project_name_input.verify_present
    @project_name_input.send_keys project_name
    @create_project_btn.click
    sleep(2)
  end

  def click_login_from_login_modal
    @login_modal_login_btn.click
  end

  def make_new_project(project_name)
    @project_name_input.send_keys project_name
    @create_project_btn.click
  end

end