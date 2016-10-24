class DeleteProjectModule < PageObject

  @delete_project_form_overlay = WebElement.new(:class => 'DeleteProjectModal-deleteForm')
  @delete_project_btn = WebElement.new({:class => 'DeleteProjectModal-deleteButton'},@delete_project_form_overlay)

  def delete_project
    # delete_project_element.when_present.click
    @delete_project_btn.click
    sleep(2)
  end

end