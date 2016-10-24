class EditItemModal < PageObject
    @cancel= WebElement.new({:css => ".remodal-cancel:not(.Modal-close)"})
    @close= WebElement.new({:css => ".Modal-close"})
    @submit= WebElement.new({:css => ".remodal-confirm"})
    @error_message= WebElement.new({:css => ".error"})
    @quantity= WebElement.new({:id => "product-quantity"})
    @cpn= WebElement.new({:id => "product-ipn"})
    @maximum= WebElement.new({:css => ".Modal-dialog strong:nth-child(1)"})
    @minimum= WebElement.new({:css => ".Modal-dialog strong:nth-child(3)"})
    @increment= WebElement.new({:css => ".Modal-dialog strong:nth-child(5)"})
    @quantity_label= WebElement.new({:css => "label[for=product-quantity]"})
    @cpn_label= WebElement.new({:css => "label[for=product-ipn]"})
    @header= WebElement.new({:css => ".Modal-header"})

  def verify_visible
    @submit.verify_visible
    @cancel.verify_visible
    @remove.verify_visible
    @close.verify_visible
    @quantity.verify_visible
    @cpn.verify_visible
    @header.verify_visible
  end

  def verify_language(language)
    if language == "German"
      @maximum.verify_text "Maximal"
      @minimum.verify_text "Mindestens"
      @increment.verify_text "Bestelleinheit"
      @quantity_label.verify_text "Menge"
      @cpn_label.verify_text "Kunden-Teilenummer"
      @cancel.verify_text "ABBRECHEN"
      @submit.verify_text "AKTUALISIEREN"
    elsif language == "Chinese"
      @maximum.verify_text "最大量"
      @minimum.verify_text "最小量"
      @increment.verify_text "增量"
      @quantity_label.verify_text "数量"
      @cpn_label.verify_text "客户零件编号"
      @submit.verify_text "更新"
      @cancel.verify_text "取消"
    else
      raise Exception "Lanaguage #{language} not supported"
    end
  end
end