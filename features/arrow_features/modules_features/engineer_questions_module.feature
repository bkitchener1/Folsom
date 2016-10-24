Feature: EngineerQuestionsModule
  As a user I want a Engineer module on the Research & Events Landing Page

  @ARROW_1294 @desktop @full
  Scenario: User can ask an Engineer a Question from the Research and Events Landing page on different devices
    Given I visit the Divisional Landing Page
    Then I can see a Promo to Ask an Engineer a Question
    And The Ask an Engineer a Question Promo has a Title
#    And The Ask an Engineer a Question Promo has information text
    And The Ask an Engineer a Question Promo has a Video Chat Button

