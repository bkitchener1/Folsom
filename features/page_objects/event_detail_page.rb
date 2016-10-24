
class EventDetailPage < PageObject

  @page_url = "#{$base_url}/#{FigNewton.event_detail_url}"


  @event_detail_parent = WebElement.new(:class => 'Article-head')
  @event_article_title = WebElement.new({:class => 'Article-title'},@event_detail_parent)
  @event_article_date = WebElement.new({:class => 'Article-date'},@event_detail_parent)
  @event_article_share_icon = WebElement.new({:class=>'Icon--share'},@event_detail_parent)
  @event_article_save_icon = WebElement.new('.Icon--save')

  @article_image_parent = WebElement.new(:class => 'Article-image')
  @event_article_image = WebElement.new("img",@article_image_parent)
  @event_article_image_caption = WebElement.new({:class => 'Article-image-caption'},@event_article_image)
  @event_detail_text = WebElement.new(".Article-body-firstp")

  @related_event_parent = WebElement.new(:class => 'Article-related')
  @related_event = WebElement.new({:class => 'CarouselModule-slide'},@related_event_parent)
  @related_event_date = WebElement.new({:class => 'EventSquare-date'},@related_event_parent)

  #Manufacturer
  @manufacturer_parent = WebElement.new(:class => 'EventDetail-manufacturers')
  #@manufacturer_heading){manufacturer_parent_element.h2_element(:class => 'BlackHeader')}
  @manufacturer_heading = WebElement.new("a",@manufacturer_parent)

  def click_save_to_project_image
    @event_article_save_icon.verify_visible(30).click
    sleep(2)
  end

  def create_project_from_save_to_my_proj_modal(project_name)
    if(@modal_create_proj_btn.visiible?)
      @modal_create_proj_btn.verify_visible.click
    end
    CreateProjectModal.new.create_new_project(project_name)
  end


  def verify_related_events_date_is_a_future_date
    curr_date = (Time.now).strftime('%d %b %Y')
    @related_event_date.each do |related_event_date|
      expect(Date.parse(related_event_date.text) >= Date.parse(curr_date)).to be_truthy, "Related Event Date: #{Date.parse(related_event_date.text)} -- is a past date"
    end
  end


  class EventLocation < PageObject
    @related_event_title = WebElement.new(:class => 'EventSquare-title')
    @related_event_date = WebElement.new(:class => 'EventSquare-date')
    @related_event_address = WebElement.new(:class => 'EventSquare-address')
    @related_event_calendar_image = WebElement.new(:class => 'Icon--add-to-calendar')
    @related_event_map_image = WebElement.new(:class => 'Icon Icon--circle Icon--pin')
    @register_button = WebElement.new(class: 'Button Button--orange')
    @related_event_register = WebElement.new("a:nth-child(1)")

    def get_related_event_register_link
      @related_event_register.attribute('href')
    end

  end

end