class CustomiseColumns < PageObject
  # Customise Search Columns locators/functions:
  @customise_column = WebElement.new(:class => 'ColumnControl-trigger')
  @customise_columns_menu = WebElement.new(:class => 'ColumnControl-dropDown')
  @custom_column_by_manu = WebElement.new(:css => '#column-manufacturer')
  @custom_column_by_type = WebElement.new(:css => '#column-type')
  @custom_column_by_description = WebElement.new(:css => '#column-description')
  @custom_column_by_stock = WebElement.new(:css => '#column-stock')

  @custom_column_by_manu_label = WebElement.new(:css => 'label[for="column-manufacturer"]')
  @custom_column_by_type_label = WebElement.new(:css => 'label[for="column-type"]')
  @custom_column_by_description_label = WebElement.new(:css => 'label[for="column-description"]')
  @custom_column_by_stock_label = WebElement.new(:css => 'label[for="column-stock"]')

  @apply_custom_column_btn = WebElement.new('.apply',@customise_columns_menu)
  @cancel_custom_column_btn = WebElement.new(".cancel",@customise_columns_menu)
  @error_message = WebElement.new(".error")
  @column_selectors = WebElement.new('.js-Column-columnControl')

  def deselect_column(name)
    case name
      when "Manufacturer"
        @custom_column_by_manu_label.click if @custom_column_by_manu.selected?
      when "Type"
        @custom_column_by_type_label.click if @custom_column_by_type.selected?
      when "Description"
        @custom_column_by_description_label.click if @custom_column_by_description.selected?
      when "Stock"
        @custom_column_by_stock_label.click if @custom_column_by_stock.selected?
    end
  end

  def select_column(name)
    case name
      when "Manufacturer"
        @custom_column_by_manu_label.click if not @custom_column_by_manu.selected?
      when "Type"
        @custom_column_by_type_label.click if not @custom_column_by_type.selected?
      when "Description"
        @custom_column_by_description_label.click if not @custom_column_by_description.selected?
      when "Stock"
        @custom_column_by_stock_label.click if not @custom_column_by_stock.selected?
    end
  end

  def number_of_deselected_columns
    @customise_column.click
    @count = 0
    @column_selectors.each do |checkbox|
      $stdout.puts checkbox.attribute('class')
      @count =+ 1 unless checkbox.selected?
    end
    @count
  end



end

