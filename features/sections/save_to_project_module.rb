class SaveToMyProjects < PageObject

  #for not logged in user
  @save_to_my_project_modal_parent = WebElement.new(:class => 'Modal-designCenter')
  @save_to_my_project_modal_title = WebElement.new('h1',@save_to_my_project_modal_parent)
  @save_to_my_project_intro = WebElement.new(:class => 'Modal-intro')
  @save_to_my_project_button_parent = WebElement.new(:class => 'Modal-buttons')
  @modal_login_btn = WebElement.new("")
  @modal_register_btn = WebElement.new("")
  @project_label = WebElement.new(".Modal-allProjects-select")

  #after login
  @modal_create_proj_btn = WebElement.new(:class => 'Modal-createSaveButtons-create')
  @modal_save_btn = WebElement.new('.Modal-createSaveButtons-save')

  def select_project_from_project_list(project_name)
    @project_label.where(:text,project_name).click
  end

  def click_save_btn_to_add_to_selected_project
    @modal_save_btn.verify_visible.click
  end

  def click_modal_login_btn
    @modal_login_btn.verify_visible.click
  end

end