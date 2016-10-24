class FirstTimeUserExperience < PageObject

  @first_time_user_exp_parent = WebElement.new(:class => 'TutorialStartBar')

  @welcome_header = WebElement.new("h2",@first_time_user_exp_parent)
  @yes_explore_btn = WebElement.new('a.js-tutorialStart')
  @not_now_btn = WebElement.new('.js-tutorialDelay')
  @never_btn = WebElement.new('.js-tutorialNever')

  @start_tour_btn = WebElement.new(".Tutorial-Start")
  @mob_first_time_user_exp_carousel = WebElement.new(:class => 'Tutorial-CarouselTour-item')
  @mob_first_time_user_exp_pagination = WebElement.new(:css => 'ul.Tutorial-CarouselTour-pagination>li')
  @mob_first_time_user_exp_start_btn = WebElement.new(:class => 'Tutorial-mobileStart')
  @tutorial_number = WebElement.new(:css => 'a.active')
  @header = WebElement.new(".Tutorial-Header")

  def verify_tutorial_step num
    WebElement.new("a.active[data-stepnumber='#{num}']").verify_visible

  end
end