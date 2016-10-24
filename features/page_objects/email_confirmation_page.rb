class EmailConfirmationPage < PageObject

  @container = WebElement.new(class: 'Modal-designCenter Modal-designCenter--engineerMessage')
  @sending_successful = WebElement.new(class: 'Icon--tick Icon')
  @continue_button = WebElement.new(class: 'Button Button--green u-button-full remodal-cancel')

  def successful?
    @container.focus
    @continue_button.click
  end


end