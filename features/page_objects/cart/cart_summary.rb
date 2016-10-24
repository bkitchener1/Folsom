class CartSummary < PageObject
  @page_url = "#{$base_url}/cart"

  @item_count_message = WebElement.new({:css=> "div[name=TotalCartItems]"})
  @submit = WebElement.new({:css=>".remodal-confirm"})
  @cancel = WebElement.new({:css =>".remodal-cancel"})
  @error_message = WebElement.new({:css=>".error"})
  @quantity = WebElement.new({:id=>'product-quantity'})
  @cpn = WebElement.new( {:id=>"product-ipn"})
  @modal_header = WebElement.new({:css=>".Modal-header"})
  @got_a_question = WebElement.new({:css => ".GotAQuestion-chatText-heading"})
  @min_qty_error_msg = WebElement.new({:id=>"mustBeBetweenError"})
  @increment_error_msg = WebElement.new({:id=>"incrementError"})
  @required_error_message = WebElement.new({:id=>"noQuantityError"})
  @error_message = WebElement.new({:id=>"errorMessage"})

  @order_summary = CartOrderSummary.new(:class=>"order-summary")
  @item_row = CartSummaryRowItem.new(:css=>".CartSummary-textBody")
  @remove_item_modal= RemoveItemModal.new("div[style*=block] .Modal-dialog")
  @edit_item_modal= EditItemModal.new(:css=>"div[style*=block] .Modal-dialog")
  @header = ArrowHeader.new()

  @gotaquestion = WebElement.new(:css=>".chatModule")
  @overlay = WebElement.new(".Overlay")
  @chatwithuslive = WebElement.new(".Button-LiveChat--active")

  def verify_language(language)
    @order_summary.expand_mobile_order_summary
    if language == "German"
      @item_count_message.verify_text "Artikel im Warenkorb"
      @item_row.first.ships_from.verify_text "Lieferung ab"
      @item_row.first.est_ship.verify_text "Gesch. Versanddatum"
      @item_row.first.item_quantity.verify_text "Menge"
      @item_row.first.item_cpn.verify_text "Verbr.-Produktnr."
      @item_row.first.item_price.verify_text "Preis"
      @item_row.first.item_total.verify_text "Summe"
      @order_summary.total.verify_text "SUMME"
      @order_summary.promo_message.verify_text "Sie haben einen Aktionscode? Geben Sie den Code am Ende des Bezahlvorgangs ein."
      @order_summary.continue.verify_text "SICHERE ZAHLUNGSABWICKLUNG"
      if $size == "desktop"
        @order_summary.header.verify_text "BESTELLÜBERSICHT"
        @got_a_question.verify_text "Sie haben eine Frage?"
        @got_a_question.verify_text "Sprechen Sie jetzt mit einem Kundendienstmitarbeiter."
      end
    elsif language == "Chinese"
      @item_count_message.verify_text "您的购物车中有 1 个项目"
      @item_row.first.ships_from.verify_text "出货地为"
      @item_row.first.est_ship.verify_text "预计付运"
      @item_row.first.item_quantity.verify_text "数量"
      @item_row.first.item_cpn.verify_text "CPN"
      @item_row.first.item_price.verify_text "价格"
      @item_row.first.item_total.verify_text "总数"
      @order_summary.promo_message.verify_text "已经有促销代码了？在结帐过程最后输入促销代码。"
      @order_summary.header.verify_text "订单概览"
      @order_summary.total.verify_text "总数"
      @order_summary.continue.verify_text "安全结帐"
      if $size == "desktop"
        @got_a_question.verify_text "有问题"
        @got_a_question.verify_text "立刻与客户服务代表进行沟通"
      end
    else
      raise Exception "Do not support language #{language}"
    end
  end

  def open_page_in_language(language)
    if $size == "mobile" or $size == "tablet"
      if language == "German"
        $driver.get(FigNewton.base_url + "de-de/cart")
      elsif language == "Chinese"
        $driver.get(FigNewton.base_url + "zh-cn/cart")
      else
        raise Exception "Do not support language #{language}"
      end
    else
      @header.change_language(language)
    end
    sleep 5
  end

  def first_item
    @item_row[0]
  end

  def verify_visible
    @item_count_message.verify_visible
  end

  def delete_first_item()

    row = @item_row[0]
    row.trash_can.click
    @submit.click
  end

  def update_first_item_quantity(count)
    @item_row[0].pencil.click
    @quantity.set_text(count)
    sleep 2
    @submit.click
    @overlay.verify_not_visible 120
    $driver.wait_for_ajax
  end

  def update_first_item_cpn(text)
    @item_row[0].pencil.click
    @cpn.set_text(text)
    @submit.click
    sleep(2)
    $driver.wait_for_ajax
  end

  def delete_item(text)
    @item_row.trash_can.click
    @submit.click
  end

  def verify_item_row(text,quantity,price,total)
    row = @item_row.select{|item| item.text.include? text}.first
    row.item_quantity.verify_text quantity
  end

end