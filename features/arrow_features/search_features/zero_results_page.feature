@cms_dependent
Feature: ZeroResultsPage
  As a user I want to see a "Nothing found" page when my parametric product search produces no results

  @ARROW_435 @full @smoke @desktop @mobile
    Scenario: The ZRP displays on different breakpoints when no Search Results are found
    And I have searched the Arrow site for Product "zsdvsvsdvadsvd"
    Then I can see the helpful text telling me that no results were found
    And I have at least "1" buttons to help me

  @ARROW_435 @full @wide @phablet @tablet
  Scenario: The ZRP displays on breakpoints when no Search Results are found
    And I have searched the Arrow site for Product "zvsfdbhfjg"
    Then I can see the helpful text telling me that no results were found
    And I have at least "1" buttons to help me

  @ARROW_1799 @full @smoke
  Scenario: ZRP displays when no matching Research and Events results are found
    Given I have searched the Arrow site for Research and Events "sgdsfghdthhtryj"
    Then I can see the helpful text telling me that no results were found