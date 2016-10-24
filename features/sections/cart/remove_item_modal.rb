class RemoveItemModal < PageObject

  @cancel= WebElement.new({:css => ".remodal-cancel:not(.Modal-close)"})
  @remove= WebElement.new({:css => ".remodal-confirm"})
  @close= WebElement.new({:css => ".Modal-close"})
  @quantity= WebElement.new({:css => ".Modal-input-container div:nth-child(3)"})
  @thumbnail= WebElement.new({:css => "img[src*=download]"})
  @item_mpn= WebElement.new({:css => ".Modal-input-container"})
  @item_text= WebElement.new({:css => ".Modal-input-container"})
  @header= WebElement.new({:css => ".Modal-header"})

  def verify_visible
    @thumbnail.verify_present
    @cancel.verify_visible
    @remove.verify_visible
    @close.verify_visible
    @quantity.verify_visible
    @thumbnail.verify_visible
    @item_text.verify_visible
  end

  def verify_language(language)
    if language == "German"
      @header.verify_text "Diesen Artikel aus Ihrem Warenkorb entfernen?"
      @quantity.verify_text "Menge"
      @remove.verify_text "ENTFERNEN"
      @cancel.verify_text "ABBRECHEN"
    elsif language == "Chinese"
      @header.verify_text "确定从您的购物车移除此项目？"
      @quantity.verify_text "数量"
      @remove.verify_text "移除"
      @cancel.verify_text "取消"
    else
      raise Exception "Lanaguage #{language} not supported"
    end
  end
end