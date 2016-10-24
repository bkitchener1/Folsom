class AccordionBlock < PageObject

  @accordion_heading = WebElement.new({:class => 'Accordion-heading'})
  @accordion_sub_heading = WebElement.new(:class => 'Accordion-heading--sub')

  @accordion_body = WebElement.new(:class => 'Accordion-body')
  @faq_answer = WebElement.new(:class => 'Accordion-paragraph')

  @plus_icon = WebElement.new(:class => 'Icon--plus')
  @minus_icon= WebElement.new(:class => 'Icon--minus')
  @first_level= WebElement.new(".Faq-container>.Accordion>.Accordion-block")
  @second_level= WebElement.new(".Faq-container>.Accordion>.Accordion-block>.Accordion-body>.Accordion>.Accordion-block")

  def is_faq_answer_visible
    @faq_answer.displayed?
  end

  def plus_count
    @plus_icon.count
  end

  def minus_count
    @minus_icon.count
  end

  def expand_all_faqs
    @first_level.each do |row|
        row.click
      sleep(1)
    end
    @second_level.each do |row|
      row.click
      sleep(1)
    end
  end
end

class Accordion < PageObject

  @low_level_blocks = AccordionBlock.new(:class => 'Accordion')
  @accordion_blocks = AccordionBlock.new({:class => 'Accordion-block'})

  def first_high_level_accordion
    @accordion_blocks.first
  end

  def first_low_level_accordion
    @low_level_blocks.first
  end

  def faq_count
    @accordion_blocks.count
  end

end