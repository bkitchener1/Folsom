@cms_dependent
Feature: CounterModule
  As a user I want to see Reference Design counter module

  @ARROW_1846-54 @full @desktop
  Scenario Outline: User can see Reference Design counter module on Research and Event Landing page on Desktop devices
    Given I visit the Research and Events Landing Page
    Then I can see '<counter_type>' Counter Module
    #And I can see Counter Module Icon
    And I can see Count figure
    And I can see Counter Module Summary
    Examples:
      | counter_type     |
      | Reference Design |
      | Product          |
      | Manufacturer     |

  @ARROW_1846-54 @full @mobile @tablet
  Scenario: User can see Reference Design counter module on Research and Event Landing page on Mobile devices
    And I visit the Research and Events Landing Page
    Then I can see only one Counter module to be active


