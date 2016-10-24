Then(/^I can see '(.*)' Counter Module$/) do |counter_type|
  case counter_type
    when 'Reference Design'
      CounterModule.new.ref_des_counter_slide[0].verify_visible
     # @counter_module = CounterModule::CounterCarousel.new(@current_page.ref_des_counter_slide_elements.first)
    #expect(@current_page.ref_des_counter_slide_icon_element.visible?).to be_truthy, "Reference Design Counter Module is not displayed"
    #@counter_module = CounterModule::CounterCarousel.new(@current_page.ref_des_counter_slide_icon_element.parent)
    when 'Product'
      CounterModule.new.ref_des_counter_slide[1].verify_visible
     # @counter_module = CounterModule::CounterCarousel.new(@current_page.ref_des_counter_slide_elements[1])
    # expect(@current_page.prod_counter_slide_icon_element.visible?).to be_truthy, "Product Counter Module is not displayed"
    # @counter_module = CounterModule::CounterCarousel.new(@current_page.prod_counter_slide_icon_element.parent)
    when 'Manufacturer'
      CounterModule.new.ref_des_counter_slide[2].verify_visible
     # @counter_module = CounterModule::CounterCarousel.new(@current_page.ref_des_counter_slide_elements[2])
    # expect(@current_page.manu_counter_slide_icon_element.visible?).to be_truthy, "Manufacturer Counter Module is not displayed"
    # @counter_module = CounterModule::CounterCarousel.new(@current_page.manu_counter_slide_icon_element.parent)
  end
end

Then(/^I can see only one Counter module to be active$/) do
  CounterModule.mobile_counter_slide.verify_count 1
end

And(/^I can see Count figure$/) do
  CounterCarousel.counter_slide_count.verify_visible
end

And(/^I can see Counter Module Summary$/) do
  CounterCarousel.counter_slide_summary.verify_visible
end
