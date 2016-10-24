class Product < PageObject
  attr_accessor :prod_name,:prod_url

  @prod_cat_link = WebElement.new(:class => 'Categories-item-link')
  @prod_header = WebElement.new("h3")
  @prod_selector_btn = WebElement.new('.Button')
  @sub_prod_headers = WebElement.new('h3')
  @sub_prods = WebElement.new('.js-open-drawer.is-visible .CategoryListings-subItems-item a')
  @prod_cat_counter = WebElement.new('ul.CategoryListings-stats li')
  @prod_category_title = WebElement.new('h2')

  def prod_name
    # prod_cat_link_element.attribute('data-category-id')
    @prod_header.text
  end

  def prod_url
    @prod_cat_link.attribute('href')
  end

  def sub_prod_links
    @sub_prods.collect { |sub_prod_elem| sub_prod_elem.attribute('href') }
  end

  def click_sub_product_category_title
    @sub_prods.click
  end

  def click_prod_selector_button
    @prod_selector_btn.click
  end
end

class ProductCategory  < PageObject

  @prod_cats = WebElement.new(:class => 'Categories-item')
  @product_count = WebElement.new(:css => 'ul.Categories-items div.Categories-item-right p')

  #Mobile
  @product_overlay = WebElement.new('.Overlay.is-visible')
  @product_overlay_close= WebElement.new('.close-SubCategories', @product_overlay)
  @mobile_sub_prods= WebElement.new('ul.CategoryListings-items a', @product_overlay)
  @prod_selector_btn= WebElement.new('.Button', @product_overlay)
  @mobile_prod_category_title = WebElement.new('h2', @product_overlay)
  @mobile_prod_cat_counter = WebElement.new('ul.CategoryListings-stats li', @product_overlay)
  @see_all_parent = WebElement.new(:class => 'Categories-button')
  @see_all = WebElement.new({:link_text => 'See all'}, @see_all_parent)

  def get_product_count_of_all_product_category
    if(@see_all.displayed?)
      @see_all.click
    end
    @product_count.collect { |para_elem| para_elem.text.gsub(' Products', '').gsub(',', '').to_i }
  end

  # def is_product_cat_expanded(prod_cat_elem)
  #   does_element_contain_is_visible(prod_cat_elem)
  # end
  #
  # def expand_product_cat(prod_cat_elem)
  #   begin
  #     prod_cat_elem.hover
  #     prod_cat_elem.h3_element.when_present.click
  #   rescue NoMethodError
  #     raise "Content not available. Please update Sitecore Manufacturer Product Category."
  #   end
  # end
  #
  # def close_overlay
  #   product_overlay_close_element.click
  # end
  #
  # def get_product_count_of_all_product_category
  #   if(see_all_element.displayed?)
  #     see_all_element.click
  #   end
  #   product_count_elements.collect { |para_elem| para_elem.text.gsub(' Products', '').gsub(',', '').to_i }
  # end
end