Feature: Quick-Close search results columns

  @smoke @full @ARW_789 @desktop
  Scenario: Customer can close a column
    When I search the Arrow site for a Product
    Then I can quickly close a search results column

  @smoke @full @ARW_789 @desktop
  Scenario: Customer can only select open columns
    When I search the Arrow site for a Product
    When I have quickly closed a search results column
    Then I can see the column deletion reflected in the column chooser
