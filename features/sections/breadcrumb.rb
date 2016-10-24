class Breadcrumb < PageObject
  @breadcrumb_div = WebElement.new(:class => 'Breadcrumb')
  @breadcrumb_ul = WebElement.new({:class => 'Content'},@breadcrumb_div)
  @breadcrumbs = WebElement.new('div.Breadcrumb li[class="Breadcrumb-item"]')
  @breadcrumb_back = WebElement.new(:class => 'js-backPage')

  def get_breadcrumb
    @breadcrumbs.collect { |crumb | crumb.text }.join(" ")
  end

  def verify_breadcrumb(text)
    expect(get_breadcrumb).to eq text
  end
end