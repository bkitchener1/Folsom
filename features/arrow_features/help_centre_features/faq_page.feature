@desktop @tablet @mobile
Feature: FAQFeature

  @ARROW_1363 @full
    Scenario: Users can see an Accordion of High and Low Level Questions with Answers
    Given I visit the FAQ Page
    Then I can see an Accordion of High Level FAQs
    When I click on a High Level FAQ
    Then I can see an Accordion of Low level FAQ's
    When I click on a Low level FAQ
    Then I can see and Answer to the FAQ


  @ARROW_1363 @full
    Scenario: User can see Plus or Minus icons when they view FAQs
    Given I visit the FAQ Page
    Then All FAQs have a Plus icon
    When I expand all the FAQ levels
    Then I should see Minus icons for each

