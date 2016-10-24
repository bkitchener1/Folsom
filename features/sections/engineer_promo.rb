class EngineerPromo < PageObject
  @engineer_image = WebElement.new(class: 'PersonSquare-image')
  @engineer_name = WebElement.new(class: 'PersonSquare-title')
  @availability_bubble = WebElement.new('.AvailablityBubble')
  @role_label = WebElement.new(class: 'Tags--Categories')
  @expertise_tags = WebElement.new(class: 'Tags--Engineer')
  @message_button = WebElement.new(class: 'js-message-engineer')

  def verify_elements_displayed
    @engineer_image.verify_visible
    @engineer_name.verify_visible
    @role_label.verify_visible
    @expertise_tags.verify_visible
    @message_button.verify_visible
  end

end