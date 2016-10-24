class PersonSquare < PageObject
  @person_square_content_panels = WebElement.new(class: 'PersonSquare-Content')
  @person_square_title = WebElement.new(:class => 'PersonSquare-title')
  @availability_bubble = WebElement.new(:class => 'AvailablityBubble')
  @message_engineer_btn = WebElement.new('.js-message-engineer')
  @view_profile_btn = WebElement.new('.Button--inverted-colors')
  @engineers_tags = WebElement.new(:class => 'Tag--green')

  def hover_over_engineer
    @person_square_content_panels.hover
  end

  def number_of_tags_visible
    @engineers_tags.count
  end
end