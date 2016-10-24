class ArticlePage < PageObject

  @title = WebElement.new(:class => 'Article-title')
  @date = WebElement.new(:class => 'Article-date')
  @share_btn = WebElement.new('article a.Icon--share')
  @add_content_btn = WebElement.new('article span.Icon--save')
  @main_img = WebElement.new('.Article-image picture>img')
  @main_img_caption = WebElement.new(:class => 'Article-image-caption')
  @related_content_sidebar = WebElement.new(:class => 'Article-sidebar')
  @article_content = WebElement.new(:class => 'Article-body-content')
  @first_para = WebElement.new(:class => 'Article-body-firstp')
  @article_img = WebElement.new('Article-image>img')
  @article_img_caption = WebElement.new(:class => 'Article-image-caption')
  @article_quote = WebElement.new(:class => 'Article-quote')
  @authors = WebElement.new(:class => 'Article-author')
  @side_menu = WebElement.new(:class => 'Article-body-side')
  @written_by = WebElement.new({:class => 'Article-writtenby'},@side_menu)
  @author_imgs = WebElement.new(:css => '.Article-author-photo>picture>img')
  @author_names = WebElement.new(:css => 'div.Article-author-name a')
  @author_company_names = WebElement.new( :class => 'Article-author-company-name')
  @author_bios = WebElement.new(:class => 'Article-author-bio')
  @read_more = WebElement.new("a",@author_bios)
  @arrow_page_tags = WebElement.new(:class => 'Tags')

  def click_author_name
    @author_names.click
  end

  def click_read_more_for_author_description
    @read_more.click
  end

end