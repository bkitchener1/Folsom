class Division < PageObject

  @title = WebElement.new(:class => 'DivisionsMenu-cell-title')
  @description = WebElement.new(:class => 'DivisionsMenu-cell-description')
end

class DivisionsMenu < PageObject

  @divisions_menu = WebElement.new('.Head .DivisionsMenu')
  @divisions_items = WebElement.new(:class => 'DivisionsMenu-link')

  @main_divisions_item = WebElement.new('.DivisionsMenu-cell--main')
  @close_divisions_menu = WebElement.new('.Icon--cross', @divisions_menu)
  @divisions = Division.new('.DivisionsMenu-link')
  def is_divisions_menu_displayed
    @divisions_menu.displayed?
  end

  def close_divisions_menu
    @close_divisions_menu.click
  end

  def get_no_of_divisions_items
    @divisions_items.count
  end

  # def is_divisions_menu_item_title_displayed(parent_elem)
  #   parent_elem.paragraph_element(:class => 'DivisionsMenu-cell-title').displayed?
  # end
  #
  # def is_divisions_menu_item_description_displayed(parent_elem)
  #   parent_elem.paragraph_element(:class => 'DivisionsMenu-cell-description').displayed?
  # end

end