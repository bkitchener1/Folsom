class JumpToLinks < PageObject

  @jump_to_list = WebElement.new(:class => 'Part-Category-jumpTo ')
  @jump_to_list_items = WebElement.new(:class => 'JumpTo-item')

  def get_no_of_jump_to_links
    @jump_to_list_items.count
  end
end