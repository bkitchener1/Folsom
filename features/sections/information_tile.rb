class InformationTile < PageObject
  @title = WebElement.new(:class => 'InformationTile-details-title')
  @manufacturer = WebElement.new(:class => 'InformationTile-details-manufacturers')
  @tags = TagItem.new(".Tags-item")
  @creation_date = WebElement.new('.InformationTile-creation')
  @save_btn = WebElement.new(:class => 'Icon--save')
  @share_btn = WebElement.new('.Icon--share')
  @envison_btn = WebElement.new(:class => 'Icon--envision')
  @pdf_icon = WebElement.new(:class => 'Icon--pdf')
  @description = WebElement.new(:css => 'p[class$="category"]')

  @price = WebElement.new(:class => 'InformationTile-price')
  @costing_unit = WebElement.new(:class => 'InformationTile-costingUnit')
  @play_icon = WebElement.new(".Icon--play")
  @module_prod_stk = WebElement.new(".DoubleCtas>a")
  @module_prod_buy = WebElement.new('.DoubleCtas .ProductPricing-buyingOption')

  @news_item = WebElement.new(:class => 'NewsModule--figure')

  #Ref_Des_specific
  @reference_design_module_tag = WebElement.new(:class => 'Tags-item-text')
  @reference_design_module_desc = WebElement.new(:class => 'InformationTile-details-description')

  #Cross_Ref_specific
  @cross_ref_product_detail = WebElement.new(:class => 'InformationTile-productDetails')
  @product_module_manufacturer = WebElement.new(:css => 'h5[class$="manufacturers"]')

end
